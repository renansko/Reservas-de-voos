defmodule Viagens do
  alias Viagens.Users.Agent, as: AgentUser
  alias Viagens.Reservas.Agent, as: AgentReserva
  alias Viagens.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias Viagens.Reservas.CreateOrUpdate, as: CreateOrUpdateReserva

  def start_agents do
    AgentUser.start_link(%{})
    AgentReserva.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_reserva(params), to: CreateOrUpdateReserva, as: :call
end
