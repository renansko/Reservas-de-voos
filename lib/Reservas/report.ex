defmodule Viagens.Reservas.Report do
  alias Viagens.Reservas.Reserva
  alias Viagens.Reservas.Agent, as: ReservaAgent

  def create(filename \\ "report.csv") do
    order_list = build_reserva_list()

    File.write(filename, order_list)
  end

  defp build_reserva_list do
    ReservaAgent.list_all()
    |> Map.values()
    |> Enum.map(fn reserva -> reserva_string(reserva) end)
  end

  defp reserva_string(%Reserva{
         user_id: id,
         embarque_local: embarque,
         desembarque_local: desenbarque,
         data_reserva: data
       }) do
    "#{id}, #{embarque}, #{desenbarque}, #{data} \n"
  end
end
