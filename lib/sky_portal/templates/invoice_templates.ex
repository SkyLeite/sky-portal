defmodule SkyPortal.Templates.InvoiceTemplates do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoice_templates" do
    field(:bill_to, :string)
    field(:default_due_days, :integer)
    field(:from, :string)
    field(:payment_method, :string)

    timestamps()
  end

  @doc false
  def changeset(invoices, attrs) do
    invoices
    |> cast(attrs, [:payment_method, :bill_to, :from, :default_due_days])
    |> validate_required([:payment_method, :bill_to, :from, :default_due_days])
  end
end
