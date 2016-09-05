defmodule Ctest.Field do
  use Ctest.Web, :model

  schema "fields" do
    field :name, :string
    field :type, :integer

    belongs_to :category, Ctest.Category, foreign_key: :category_id
    #belongs_to :item, Ctest.Item, foreign_key: :item_id
    has_many :field_values, Ctest.FieldValue

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields ~w(name type)
  @optional_fields ~w()

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields)
    |> cast_assoc(:field_values)
  end
end
