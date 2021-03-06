defmodule Scriptdrop.Company do
  @moduledoc """
  The Company context.
  """

  import Ecto.Query, warn: false
  alias Scriptdrop.Repo

  alias Scriptdrop.Company.Courier

  @doc """
  Returns the list of couriers.

  ## Examples

      iex> list_couriers()
      [%Courier{}, ...]

  """
  def list_couriers do
    Repo.all(Courier) |> Repo.preload(:address)
  end

  @doc """
  Gets a single courier.

  Raises `Ecto.NoResultsError` if the Courier does not exist.

  ## Examples

      iex> get_courier!(123)
      %Courier{}

      iex> get_courier!(456)
      ** (Ecto.NoResultsError)

  """
  def get_courier!(id), do: Repo.get!(Courier, id) |> Repo.preload(:address)

  @doc """
  Creates a courier.

  ## Examples

      iex> create_courier(%{field: value})
      {:ok, %Courier{}}

      iex> create_courier(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_courier(attrs \\ %{}) do
    %Courier{}
    |> Courier.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a courier.

  ## Examples

      iex> update_courier(courier, %{field: new_value})
      {:ok, %Courier{}}

      iex> update_courier(courier, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_courier(%Courier{} = courier, attrs) do
    courier
    |> Courier.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Courier.

  ## Examples

      iex> delete_courier(courier)
      {:ok, %Courier{}}

      iex> delete_courier(courier)
      {:error, %Ecto.Changeset{}}

  """
  def delete_courier(%Courier{} = courier) do
    Repo.delete(courier)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking courier changes.

  ## Examples

      iex> change_courier(courier)
      %Ecto.Changeset{source: %Courier{}}

  """
  def change_courier(%Courier{} = courier) do
    Courier.changeset(courier, %{})
  end

  alias Scriptdrop.Company.Pharmacy

  @doc """
  Returns the list of pharmacies.

  ## Examples

      iex> list_pharmacies()
      [%Pharmacy{}, ...]

  """
  def list_pharmacies do
    Repo.all(Pharmacy) |> Repo.preload(:address)
  end

  @doc """
  Gets a single pharmacy.

  Raises `Ecto.NoResultsError` if the Pharmacy does not exist.

  ## Examples

      iex> get_pharmacy!(123)
      %Pharmacy{}

      iex> get_pharmacy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pharmacy!(id), do: Repo.get!(Pharmacy, id) |> Repo.preload(:address)

  @doc """
  Creates a pharmacy.

  ## Examples

      iex> create_pharmacy(%{field: value})
      {:ok, %Pharmacy{}}

      iex> create_pharmacy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pharmacy(attrs \\ %{}) do
    %Pharmacy{}
    |> Pharmacy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pharmacy.

  ## Examples

      iex> update_pharmacy(pharmacy, %{field: new_value})
      {:ok, %Pharmacy{}}

      iex> update_pharmacy(pharmacy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pharmacy(%Pharmacy{} = pharmacy, attrs) do
    pharmacy
    |> Pharmacy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Pharmacy.

  ## Examples

      iex> delete_pharmacy(pharmacy)
      {:ok, %Pharmacy{}}

      iex> delete_pharmacy(pharmacy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pharmacy(%Pharmacy{} = pharmacy) do
    Repo.delete(pharmacy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pharmacy changes.

  ## Examples

      iex> change_pharmacy(pharmacy)
      %Ecto.Changeset{source: %Pharmacy{}}

  """
  def change_pharmacy(%Pharmacy{} = pharmacy) do
    Pharmacy.changeset(pharmacy, %{})
  end

  @doc """
  Loads a list of courier name and courier ids.

  ## Examples

      iex> load_couriers()
      [%Courier{}, ...]

  """
  def load_couriers do
    #todo refactor this bad code lol
    query =
      Courier
      |> Courier.courier_and_ids
    couriers = Repo.all query
    _couriers = Enum.map(couriers, fn %{id: key, name: value} -> {:"#{value}", key} end)
  end

  @doc """
  Loads a list of courier name and courier ids for a datalist.

  ## Examples

      iex> load_couriers_datalist()
      [%Courier{}, ...]

  """
  def load_couriers_datalist do
    #todo refactor this bad code lol
    query =
      Courier
      |> Courier.courier_and_ids
    _couriers = Repo.all query
#    couriers = Enum.map(couriers, fn %{id: key, name: value} -> {:"#{value}", key} end)
  end


  @doc """
  Loads a list of pharmacy name and pharmacy ids.

  ## Examples

      iex> load_pharmacies()
      [%Pharmacy{}, ...]

  """
  def load_pharmacies do
    #todo refactor this bad code lol whyd i make it harder than it needed to be
    query =
      Pharmacy
      |> Pharmacy.pharmacy_and_ids
    pharmacies = Repo.all query
    _pharmacies = Enum.map(pharmacies, fn %{id: key, name: value} -> {:"#{value}", key} end)
  end
end
