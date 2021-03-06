defmodule Scriptdrop.Customer.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :pickup_date, :naive_datetime
    field :undelieverable, :boolean, default: false
    field :delivered, :boolean, default: false

    belongs_to :patient, Scriptdrop.Customer.Patient, foreign_key: :patient_id
    belongs_to :pharmacy, Scriptdrop.Company.Pharmacy, foreign_key: :pharmacy_id
#    belongs_to :courier, Scriptdrop.Company.Courier, foreign_key: :courier_id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:delivered, :undelieverable, :pickup_date, :patient_id, :pharmacy_id])
    |> cast_assoc(:patient, required: true)
    |> validate_required([:delivered, :undelieverable, :pickup_date])
  end
end
