defmodule Ctest.Repo.Migrations.AddItemId do
  use Ecto.Migration

  def change do

  	alter table(:infos) do
  	  add :item_id, references(:items, on_delete: :nothing)
  	end

  	alter table(:categories) do
  	  add :item_id, references(:items, on_delete: :nothing)
  	end

  	alter table(:fields) do
  	  add :item_id, references(:items, on_delete: :nothing)
  	end

  end
end
