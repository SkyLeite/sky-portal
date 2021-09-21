defmodule SkyPortal.Outgoing do
  @moduledoc """
  The Outgoing context.
  """

  import Ecto.Query, warn: false
  alias SkyPortal.Repo

  alias SkyPortal.Outgoing.Invoices

  @doc """
  Returns the list of invoices.

  ## Examples

      iex> list_invoices()
      [%Invoices{}, ...]

  """
  def list_invoices do
    Repo.all(Invoices)
  end

  @doc """
  Gets a single invoices.

  Raises `Ecto.NoResultsError` if the Invoices does not exist.

  ## Examples

      iex> get_invoices!(123)
      %Invoices{}

      iex> get_invoices!(456)
      ** (Ecto.NoResultsError)

  """
  def get_invoices!(id), do: Repo.get!(Invoices, id)

  @doc """
  Creates a invoices.

  ## Examples

      iex> create_invoices(%{field: value})
      {:ok, %Invoices{}}

      iex> create_invoices(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_invoices(attrs \\ %{}) do
    %Invoices{}
    |> Invoices.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a invoices.

  ## Examples

      iex> update_invoices(invoices, %{field: new_value})
      {:ok, %Invoices{}}

      iex> update_invoices(invoices, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_invoices(%Invoices{} = invoices, attrs) do
    invoices
    |> Invoices.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a invoices.

  ## Examples

      iex> delete_invoices(invoices)
      {:ok, %Invoices{}}

      iex> delete_invoices(invoices)
      {:error, %Ecto.Changeset{}}

  """
  def delete_invoices(%Invoices{} = invoices) do
    Repo.delete(invoices)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking invoices changes.

  ## Examples

      iex> change_invoices(invoices)
      %Ecto.Changeset{data: %Invoices{}}

  """
  def change_invoices(%Invoices{} = invoices, attrs \\ %{}) do
    Invoices.changeset(invoices, attrs)
  end
end
