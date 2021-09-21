defmodule SkyPortal.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :bill_to, :string
      add :from, :string
      add :payment_method, :text
      add :due_date, :utc_datetime
      add :lines, {:array, :map}
      add :date, :utc_datetime

      timestamps()
    end

  end
end
