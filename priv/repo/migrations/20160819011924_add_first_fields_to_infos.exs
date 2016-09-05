defmodule Ctest.Repo.Migrations.AddFirstFieldsToInfos do
  use Ecto.Migration

  def change do
  	alter table(:infos) do
  	  add :data_string, :string
  	  add :data_integer, :integer
  	  add :data_float, :float
  	  add :data_boolean, :boolean

  	end

  end
end
