defmodule Ctest.FieldValue do
  use Ctest.Web, :model

  schema "field_values" do
    field :value, :string

    belongs_to :field, Ctest.Field, foreign_key: :field_id
    belongs_to :item_instance, Ctest.ItemInstance, foreign_key: :item_instance_id

    timestamps
  end

  #@required_fields ~w(value item_instance_id field_id)
  @required_fields ~w(value field_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(field_value, params \\ %{}) do
    field_value
    |> cast(params, @required_fields, @optional_fields)

  end
end


