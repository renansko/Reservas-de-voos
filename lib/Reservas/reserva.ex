defmodule Viagens.Reservas.Reserva do
  @keys [:id_reserva, :id_user, :data_reserva, :embarque_local, :desembarque_local, :cpf_user]

  alias Viagens.Reservas.Viagem
  alias Viagens.Users.User

  @enforce_keys @keys

  defstruct @keys

  def build(
        %User{cpf: cpf, id: id},
        %Viagem{
          embarque: embarque,
          desenbarque: desenbarque,
          data: data
        }
      ) do
    {:ok,
     %__MODULE__{
       id_reserva: UUID.uuid4(),
       data_reserva: data,
       embarque_local: embarque,
       desembarque_local: desenbarque,
       cpf_user: cpf,
       id_user: id
     }}
  end

  def build(_user, _viagem), do: {:error, "Invalid parameters in list"}
end
