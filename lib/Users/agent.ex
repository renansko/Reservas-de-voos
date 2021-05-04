defmodule Viagens.Users.Agent do
  alias Viagens.Users.User

  use Agent

  def start_link(_inicial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    Agent.update(__MODULE__, &uptade_state(&1, user))
  end

  def uptade_state(state, %User{cpf: id} = user), do: Map.put(state, id, user)

  def get(id), do: Agent.get(__MODULE__, fn state -> get_user(state, id) end)

  def get_user(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
