defmodule Viagens.Reservas.CreateOrUpdate do
  alias Viagens.Reservas.Reserva
  alias Viagens.Reservas.Agent, as: AgentReserva

  def call(%{
        data: data,
        desenbarque: desenbarque,
        embarque: embarque,
        user_id: user_id
      }) do
    data
    |> Reserva.build(desenbarque, embarque, user_id)
    |> AgentReserva.save()
  end

  # def call(%{cpf_user: cpf_user, viagem: viagem}) do
  #   with {:ok, user} <- AgentUser.get(cpf_user),
  #        IO.inspect(viagem),
  #        {:ok, viagem} <- build_viagems(viagem),
  #        {:ok, reserva} <- Reserva.build(user, viagem) do
  #     AgentReserva.save(reserva)
  #   else
  #     error -> error
  #   end
  # end

  # defp build_viagems(viagem) do
  #   viagem
  #   |> Enum.map(&build_viagem/1)
  #   |> handle_build()
  # end

  # defp build_viagem(%{
  #        embarque: embarque,
  #        desenbarque: desenbarque,
  #        ano: ano,
  #        mes: mes,
  #        dia: dia,
  #        hora: hora,
  #        min: min,
  #        sec: sec
  #        # tratar a data
  #      }) do
  #   IO.inspect(ano)

  #   case Viagem.build(embarque, desenbarque, ano, mes, dia, hora, min, sec) do
  #     {:ok, viagem} -> viagem
  #     {:error, _reason} = error -> error
  #   end
  # end

  #   defp handle_build(viagem) do
  #     if Enum.all?(viagem, &is_struct/1), do: {:ok, viagem}, else: {:error, "viagem invalida"}
  #   end
end
