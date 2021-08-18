defmodule TestProject.Shop.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "items" do
    field :amount, :integer
    field :name, :string
    many_to_many :orders, TestProject.Shop.Order, join_through: "orders_items"
    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :amount])
    |> validate_required([:name, :amount])
  end
end
