defmodule Ctest.Repo.Migrations.CreateItemInstance do
  use Ecto.Migration

  def change do
    create table(:item_instances) do
    	add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

  end
end
