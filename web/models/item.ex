defmodule Ctest.Item do
  use Ctest.Web, :model

  schema "items" do
    field :name, :string
    field :description, :string

    has_many :categories, Ctest.Category

    timestamps()
  end

  @required_fields ~w(name description)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_assoc(:categories)
  end
end
