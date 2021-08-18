defmodule TestProject.Shop.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "orders" do
    field :customer, :string
    field :phone, :string
    many_to_many :items, TestProject.Shop.Item, join_through: "orders_items"
    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:customer, :phone])
    |> validate_required([:customer, :phone])
  end
end
