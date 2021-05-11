defmodule Viagens.Users.UserTest do
  alias Viagens.Users.User
  use ExUnit.Case

  describe "build/3" do
    test "User as created" do
      response = User.build("123456", "Renan", "renan@sko")

      params =
        {:ok,
         %Viagens.Users.User{
           cpf: "123456",
           email: "renan@sko",
           id: _id,
           name: "Renan"
         }}

      assert_response = params

      assert response == assert_response
    end
  end
end
