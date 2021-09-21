defmodule SkyPortalWeb.Resolvers.Outgoing do
  def invoices(_parent, _args, _resolution) do
    SkyPortal.Outgoing.list_invoices()
  end
end
