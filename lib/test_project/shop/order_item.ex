defmodule TestProject.Shop.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  alias TestProject.Shop.Item
  alias TestProject.Shop.Order

  @primary_key false

  schema "orders_items" do
    belongs_to(:item, Item, primary_key: true)
    belongs_to(:order, Order, primary_key: true)

  end

  @doc false
  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
