defmodule Ctest.Category do
  use Ctest.Web, :model

  schema "categories" do
    field :name, :string

    has_many :fields, Ctest.Field
    belongs_to :item, Ctest.Item, foreign_key: :item_id


    timestamps()
  end

  @required_fields ~w(name item_id)
  @optional_fields ~w()
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:fields)
  end
end
