defmodule Viagens.Reservas.Agent do
  use Agent

  alias Viagens.Reservas.Reserva

  def start_link(_inicial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Reserva{id_reserva: id} = reserva) do
    uuid = id
    Agent.update(__MODULE__, &update_state(&1, reserva, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, fn state -> get_reserva(state, uuid) end)

  defp get_reserva(state, uuid) do
    case Map.get(state, uuid) do
      nil -> {:error, "Reserva nao foi encontrada"}
      reserva -> {:ok, reserva}
    end
  end

  def list_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(state, %Reserva{} = reserva, uuid), do: Map.put(state, uuid, reserva)
end
