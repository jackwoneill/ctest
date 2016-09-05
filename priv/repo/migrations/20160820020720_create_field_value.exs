defmodule Ctest.Repo.Migrations.CreateFieldValue do
  use Ecto.Migration

  def change do
    create table(:field_values) do
      add :value, :string
      add :field_id, references(:fields, on_delete: :nothing)
      add :item_instance_id, references(:item_instances, on_delete: :nothing)

      timestamps()
    end
    create index(:field_values, [:field_id])
    create index(:field_values, [:item_instance_id])

  end
end
