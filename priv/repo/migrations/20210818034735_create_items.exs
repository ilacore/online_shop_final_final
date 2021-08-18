defmodule TestProject.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :amount, :integer

      timestamps()
    end

  end
end
