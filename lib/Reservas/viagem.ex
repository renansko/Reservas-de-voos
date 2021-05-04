defmodule Viagens.Reservas.Viagem do
  @keys [:embarque, :desenbarque, :data]

  @enforce_keys @keys

  defstruct @keys

  def build(embarque, desenbarque, ano, mes, dia, hora, min, sec)
      when mes > 0 and mes < 12 do
    data = NaiveDateTime.new(ano, mes, dia, hora, min, sec)

    data
    |> build_reserva(embarque, desenbarque)
  end

  def build(_cpf, _embarque, _desenbarque, _ano, _mes, _dia, _hora, _min, _sec) do
    {:error, "invalid params"}
  end

  defp build_reserva({:ok, data}, embarque, desenbarque) do
    {:ok,
     %__MODULE__{
       embarque: embarque,
       desenbarque: desenbarque,
       data: data
     }}
  end

  defp build_reserva(_data, _embarque, _desenbarque), do: {:error, "invalid params"}
end
