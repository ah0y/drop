defmodule Scriptdrop.Company.Pharmacy do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "pharmacies" do
    field :name, :string

    #    has_one :address, Scriptdrop.Location.Address
    belongs_to :address, Scriptdrop.Location.Address, foreign_key: :address_id
    belongs_to :courier, Scriptdrop.Company.Courier, foreign_key: :courier_id
    has_many :orders, Scriptdrop.Customer.Order

    timestamps()
  end

  @doc false
  def changeset(pharmacy, attrs) do
    pharmacy
    |> cast(attrs, [:name, :address_id, :courier_id])
    |> cast_assoc(:address, required: true)
    |> validate_required([:name])
  end

  def pharmacy_and_ids(query) do
    from p in query, select: %{name: p.name, id: p.id}
  end
end
