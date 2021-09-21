defmodule SkyPortal.Repo do
  use Ecto.Repo,
    otp_app: :sky_portal,
    adapter: Ecto.Adapters.Postgres

  def fetch(query) do
    case all(query) do
      [] -> {:error, query}
      [obj] -> {:ok, obj}
      _ -> raise "Expected one or no items, got many items #{inspect(query)}"
    end
  end
end
