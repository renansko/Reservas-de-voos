defmodule Viagens.Reservas.CreateOrUpdate do
  alias Viagens.Users.Agent, as: AgentUser
  alias Viagens.Reservas.{Viagem, Reserva}
  alias Viagens.Reservas.Agent, as: AgentReserva

  def call(%{user_cpf: user_cpf, viagem: viagem}) do
    with {:ok, user} <- AgentUser.get(user_cpf),
         {:ok, viagem} <- build_viagems(viagem),
         {:ok, reserva} <- Reserva.build(user, viagem) do
      AgentReserva.save(reserva)
    end
  end

  defp build_viagems(viagem) do
    viagem
    |> Enum.map(&build_viagem/1)
    |> handle_build()
  end

  defp build_viagem(%{
         embarque: embarque,
         desenbarque: desenbarque,
         ano: ano,
         mes: mes,
         dia: dia,
         hora: hora,
         min: min,
         sec: sec
       }) do
    case Viagem.build(embarque, desenbarque, ano, mes, dia, hora, min, sec) do
      {:ok, viagem} -> viagem
      {:error, _reason} = error -> error
    end
  end

  defp handle_build(viagem) do
    if Enum.all?(viagem, &is_struct/1), do: {:ok, viagem}, else: {:error, "viagem invalida"}
  end
end
