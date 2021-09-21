defmodule SkyPortal.TemplatesTest do
  use SkyPortal.DataCase

  alias SkyPortal.Templates

  describe "invoices" do
    alias SkyPortal.Templates.Invoices

    @valid_attrs %{bill_to: "some bill_to", deafult_due_days: 42, from: "some from", payment_method: "some payment_method"}
    @update_attrs %{bill_to: "some updated bill_to", deafult_due_days: 43, from: "some updated from", payment_method: "some updated payment_method"}
    @invalid_attrs %{bill_to: nil, deafult_due_days: nil, from: nil, payment_method: nil}

    def invoices_fixture(attrs \\ %{}) do
      {:ok, invoices} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Templates.create_invoices()

      invoices
    end

    test "list_invoices/0 returns all invoices" do
      invoices = invoices_fixture()
      assert Templates.list_invoices() == [invoices]
    end

    test "get_invoices!/1 returns the invoices with given id" do
      invoices = invoices_fixture()
      assert Templates.get_invoices!(invoices.id) == invoices
    end

    test "create_invoices/1 with valid data creates a invoices" do
      assert {:ok, %Invoices{} = invoices} = Templates.create_invoices(@valid_attrs)
      assert invoices.bill_to == "some bill_to"
      assert invoices.deafult_due_days == 42
      assert invoices.from == "some from"
      assert invoices.payment_method == "some payment_method"
    end

    test "create_invoices/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Templates.create_invoices(@invalid_attrs)
    end

    test "update_invoices/2 with valid data updates the invoices" do
      invoices = invoices_fixture()
      assert {:ok, %Invoices{} = invoices} = Templates.update_invoices(invoices, @update_attrs)
      assert invoices.bill_to == "some updated bill_to"
      assert invoices.deafult_due_days == 43
      assert invoices.from == "some updated from"
      assert invoices.payment_method == "some updated payment_method"
    end

    test "update_invoices/2 with invalid data returns error changeset" do
      invoices = invoices_fixture()
      assert {:error, %Ecto.Changeset{}} = Templates.update_invoices(invoices, @invalid_attrs)
      assert invoices == Templates.get_invoices!(invoices.id)
    end

    test "delete_invoices/1 deletes the invoices" do
      invoices = invoices_fixture()
      assert {:ok, %Invoices{}} = Templates.delete_invoices(invoices)
      assert_raise Ecto.NoResultsError, fn -> Templates.get_invoices!(invoices.id) end
    end

    test "change_invoices/1 returns a invoices changeset" do
      invoices = invoices_fixture()
      assert %Ecto.Changeset{} = Templates.change_invoices(invoices)
    end
  end
end
