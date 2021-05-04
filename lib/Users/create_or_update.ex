defmodule Viagens.Users.CreateOrUpdate do
  alias Viagens.Users.User
  alias Viagens.Users.Agent, as: UserAgent

  def call(%{cpf: cpf, name: name, email: email}) do
    cpf
    |> User.build(name, email)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)

    {:ok, "Succes to save or uptade a User"}
  end

  defp save_user({:error, _reason} = error), do: error
end
