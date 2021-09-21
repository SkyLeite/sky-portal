defmodule SkyPortalWeb.Resolvers.Templates do
  def invoice_templates(_parent, _args, _resolution) do
    {:ok, SkyPortal.Templates.list_invoice_templates()}
  end

  def create_invoice_template(_parent, args, _resolution) do
    SkyPortal.Templates.create_invoice_templates(args)
  end
end
