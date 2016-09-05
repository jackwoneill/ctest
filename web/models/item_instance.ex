defmodule Ctest.ItemInstance do
  use Ctest.Web, :model

  schema "item_instances" do

    belongs_to :item, Ctest.Item, foreign_key: :item_id
    has_many :field_values, Ctest.FieldValue


    timestamps
  end

  #@required_fields ~w(item_id)
  @required_fields ~w(item_id)
  @optional_fields ~w()


  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(item_instance, params \\ :invalid) do
    item_instance
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:field_values)
    #|> validate_required(:field_values)
  end
end
