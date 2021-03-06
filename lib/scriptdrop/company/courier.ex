defmodule Scriptdrop.Company.Courier do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "couriers" do
    field :name, :string

#    has_one :address, Scriptdrop.Location.Address
    belongs_to :address, Scriptdrop.Location.Address, foreign_key: :address_id
    has_many :pharmacies, Scriptdrop.Company.Pharmacy
    has_many :orders, through: [:pharmacies, :orders]

    timestamps()
  end

  @doc false
  def changeset(courier, attrs) do
    courier
    |> cast(attrs, [:name, :address_id])
    |> cast_assoc(:address, required: true)
    |> validate_required([:name])
  end

  def courier_and_ids(query) do
    from c in query, select: %{name: c.name, id: c.id}
  end
end
