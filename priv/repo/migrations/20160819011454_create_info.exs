defmodule Ctest.Repo.Migrations.CreateInfo do
  use Ecto.Migration

  def change do
    create table(:infos) do
      add :field_id, references(:fields, on_delete: :nothing)

      timestamps()
    end
    create index(:infos, [:field_id])

  end
end
