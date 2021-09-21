defmodule SkyPortal.MetaTest do
  use SkyPortal.DataCase

  alias SkyPortal.Meta

  describe "users" do
    alias SkyPortal.Meta.Users

    @valid_attrs %{email: "some email", password: "some password"}
    @update_attrs %{email: "some updated email", password: "some updated password"}
    @invalid_attrs %{email: nil, password: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Meta.create_users()

      users
    end

    test "list_users/0 returns all users" do
      users = users_fixture()
      assert Meta.list_users() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Meta.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Meta.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.password == "some password"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meta.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Meta.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.password == "some updated password"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Meta.update_users(users, @invalid_attrs)
      assert users == Meta.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Meta.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Meta.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Meta.change_users(users)
    end
  end
end
