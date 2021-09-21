defmodule SkyPortal.Meta.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
  end
end
