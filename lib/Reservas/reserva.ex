defmodule Viagens.Reservas.Reserva do
  @keys [:id_reserva, :user_id, :data_reserva, :embarque_local, :desembarque_local]

  @enforce_keys @keys

  defstruct @keys

  def build(
        data,
        desenbarque,
        embarque,
        user_id
      ) do
    {:ok,
     %__MODULE__{
       id_reserva: UUID.uuid4(),
       data_reserva: data,
       embarque_local: embarque,
       desembarque_local: desenbarque,
       user_id: user_id
     }}
  end

  def build(_user, _viagem), do: {:error, "Invalid parameters in list"}
end
