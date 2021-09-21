defmodule SkyPortal.Outgoing.Invoices do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :bill_to, :string
    field :date, :utc_datetime
    field :due_date, :utc_datetime
    field :from, :string
    field :lines, {:array, :map}
    field :payment_method, :string

    timestamps()
  end

  @doc false
  def changeset(invoices, attrs) do
    invoices
    |> cast(attrs, [:bill_to, :from, :payment_method, :due_date, :lines, :date])
    |> validate_required([:bill_to, :from, :payment_method, :due_date, :lines, :date])
  end
end
