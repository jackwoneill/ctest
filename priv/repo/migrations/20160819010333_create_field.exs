defmodule Ctest.Repo.Migrations.CreateField do
  use Ecto.Migration

  def change do
    create table(:fields) do
      add :name, :string
      add :type, :integer
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps()
    end
    create index(:fields, [:category_id])

  end
end
