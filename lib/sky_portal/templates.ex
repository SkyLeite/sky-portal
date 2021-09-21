defmodule SkyPortal.Templates do
  @moduledoc """
  The Templates context.
  """

  import Ecto.Query, warn: false
  alias SkyPortal.Repo

  alias SkyPortal.Templates.InvoiceTemplates

  @doc """
  Returns the list of invoice_templates.

  ## Examples

      iex> list_invoice_templates()
      [%InvoiceTemplates{}, ...]

  """
  def list_invoice_templates do
    Repo.all(InvoiceTemplates)
  end

  @doc """
  Gets a single invoice_templates.

  Raises `Ecto.NoResultsError` if the InvoiceTemplates does not exist.

  ## Examples

      iex> get_invoice_templates!(123)
      %InvoiceTemplates{}

      iex> get_invoice_templates!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoice_templates!(id), do: Repo.get!(Invoices, id)

  @doc """
  Creates a invoice_templates.

  ## Examples

      iex> create_invoice_templates(%{field: value})
      {:ok, %InvoiceTemplates{}}

      iex> create_invoice_templates(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoice_templates(attrs \\ %{}) do
    %InvoiceTemplates{}
    |> InvoiceTemplates.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoice_templates.

  ## Examples

      iex> update_invoice_templates(invoices, %{field: new_value})
      {:ok, %InvoiceTemplates{}}

      iex> update_invoice_templates(invoices, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoice_templates(%InvoiceTemplates{} = invoice_templates, attrs) do
    invoice_templates
    |> InvoiceTemplates.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoice_templates.

  ## Examples

      iex> delete_invoice_templates(invoices)
      {:ok, %InvoiceTemplates{}}

      iex> delete_invoice_templates(invoices)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoice_templates(%InvoiceTemplates{} = invoice_templates) do
    Repo.delete(invoice_templates)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoice_templates changes.

  ## Examples

      iex> change_invoice_templates(invoices)
      %Ecto.Changeset{data: %InvoiceTemplates{}}

  """
  def change_invoice_templates(%InvoiceTemplates{} = invoices, attrs \\ %{}) do
    InvoiceTemplates.changeset(invoices, attrs)
  end
end
