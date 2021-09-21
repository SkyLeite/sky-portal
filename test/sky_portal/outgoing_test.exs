defmodule SkyPortal.OutgoingTest do
  use SkyPortal.DataCase

  alias SkyPortal.Outgoing

  describe "invoices" do
    alias SkyPortal.Outgoing.Invoices

    @valid_attrs %{bill_to: "some bill_to", date: "2010-04-17T14:00:00Z", due_date: "2010-04-17T14:00:00Z", from: "some from", lines: [], payment_method: "some payment_method"}
    @update_attrs %{bill_to: "some updated bill_to", date: "2011-05-18T15:01:01Z", due_date: "2011-05-18T15:01:01Z", from: "some updated from", lines: [], payment_method: "some updated payment_method"}
    @invalid_attrs %{bill_to: nil, date: nil, due_date: nil, from: nil, lines: nil, payment_method: nil}

    def invoices_fixture(attrs \\ %{}) do
      {:ok, invoices} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Outgoing.create_invoices()

      invoices
    end

    test "list_invoices/0 returns all invoices" do
      invoices = invoices_fixture()
      assert Outgoing.list_invoices() == [invoices]
    end

    test "get_invoices!/1 returns the invoices with given id" do
      invoices = invoices_fixture()
      assert Outgoing.get_invoices!(invoices.id) == invoices
    end

    test "create_invoices/1 with valid data creates a invoices" do
      assert {:ok, %Invoices{} = invoices} = Outgoing.create_invoices(@valid_attrs)
      assert invoices.bill_to == "some bill_to"
      assert invoices.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert invoices.due_date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert invoices.from == "some from"
      assert invoices.lines == []
      assert invoices.payment_method == "some payment_method"
    end

    test "create_invoices/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Outgoing.create_invoices(@invalid_attrs)
    end

    test "update_invoices/2 with valid data updates the invoices" do
      invoices = invoices_fixture()
      assert {:ok, %Invoices{} = invoices} = Outgoing.update_invoices(invoices, @update_attrs)
      assert invoices.bill_to == "some updated bill_to"
      assert invoices.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert invoices.due_date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert invoices.from == "some updated from"
      assert invoices.lines == []
      assert invoices.payment_method == "some updated payment_method"
    end

    test "update_invoices/2 with invalid data returns error changeset" do
      invoices = invoices_fixture()
      assert {:error, %Ecto.Changeset{}} = Outgoing.update_invoices(invoices, @invalid_attrs)
      assert invoices == Outgoing.get_invoices!(invoices.id)
    end

    test "delete_invoices/1 deletes the invoices" do
      invoices = invoices_fixture()
      assert {:ok, %Invoices{}} = Outgoing.delete_invoices(invoices)
      assert_raise Ecto.NoResultsError, fn -> Outgoing.get_invoices!(invoices.id) end
    end

    test "change_invoices/1 returns a invoices changeset" do
      invoices = invoices_fixture()
      assert %Ecto.Changeset{} = Outgoing.change_invoices(invoices)
    end
  end
end
