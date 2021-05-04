defmodule Viagens.Users.User do
  @keys [:id, :cpf, :name, :email]

  @enforce_keys @keys

  defstruct @keys

  def build(cpf, name, email) when is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       id: UUID.uuid4(),
       cpf: cpf,
       name: name,
       email: email
     }}
  end

  def build(_cpf, _name, _email), do: {:error, "invalid params"}
end
