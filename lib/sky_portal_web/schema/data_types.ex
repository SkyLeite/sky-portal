defmodule SkyPortalWeb.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :invoice_template do
    field(:id, :id)
    field(:payment_method, :string)
    field(:bill_to, :string)
    field(:from, :string)
    field(:default_due_days, :integer)
  end

  object :invoice_line do
    field(:description, :string)
    field(:quantity, :integer)
    field(:rate, :integer)
    field(:total, :integer)
  end

  object :invoice do
    field(:id, :id)
    field(:date, :string)
    field(:due_date, :string)
    field(:from, :string)
    field(:lines, list_of(:invoice_line))
    field(:payment_method, :string)
  end
end
