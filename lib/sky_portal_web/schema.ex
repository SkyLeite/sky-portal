defmodule SkyPortalWeb.Schema do
  use Absinthe.Schema

  alias SkyPortalWeb.Resolvers

  import_types(SkyPortalWeb.Schema.DataTypes)

  query do
    @desc "Get all the invoice templates"
    field :invoice_templates, list_of(:invoice_template) do
      resolve(&Resolvers.Templates.invoice_templates/3)
    end

    @desc "Get all the invoices"
    field :invoices, list_of(:invoice) do
      resolve(&Resolvers.Outgoing.list_invoices/3)
    end
  end

  mutation do
    @desc "Create invoice template"
    field :create_invoice_template, type: :invoice_template do
      arg(:bill_to, non_null(:string))
      arg(:default_due_days, non_null(:integer))
      arg(:from, non_null(:string))
      arg(:payment_method, non_null(:string))

      resolve(&Resolvers.Templates.create_invoice_template/3)
    end
  end
end
