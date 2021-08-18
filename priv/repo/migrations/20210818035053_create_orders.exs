defmodule TestProject.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :customer, :string
      add :phone, :string

      timestamps()
    end

  end
end
