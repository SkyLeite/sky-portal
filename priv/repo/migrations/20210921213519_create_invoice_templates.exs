defmodule SkyPortal.Repo.Migrations.CreateInvoiceTemplates do
  use Ecto.Migration

  def change do
    create table(:invoice_templates) do
      add :payment_method, :text
      add :bill_to, :text
      add :from, :text
      add :default_due_days, :integer

      timestamps()
    end

  end
end
