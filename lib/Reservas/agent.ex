defmodule Viagens.Reservas.Agent do
  use Agent

  alias Viagens.Reservas.Reserva

  def start_link(_inicial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save({:ok, %Reserva{id_reserva: id_reserva}} = {_ok, reserva}) do
    Agent.update(__MODULE__, &update_state(&1, reserva, id_reserva))

    {:ok, id_reserva}
  end

  def get(id_reserva), do: Agent.get(__MODULE__, fn state -> get_reserva(state, id_reserva) end)

  defp get_reserva(state, id_reserva) do
    case Map.get(state, id_reserva) do
      nil -> {:error, "Reserva nao foi encontrada"}
      reserva -> {:ok, reserva}
    end
  end

  def list_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(state, %Reserva{} = reserva, id_reserva),
    do: Map.put(state, id_reserva, reserva)
end
