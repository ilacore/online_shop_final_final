defmodule TestProject.Repo.Migrations.CreateOrdersItems do
  use Ecto.Migration

  def change do
    create table(:orders_items, primary_key: false) do
      add :order_id, references(:orders, type: :uuid, on_delete: :nothing), null: false, primary_key: true
      add :item_id, references(:items, type: :uuid, on_delete: :nothing), null: false, primary_key: true
    end

    create index(:orders_items, [:order_id])
    create index(:orders_items, [:item_id])
  end
end
