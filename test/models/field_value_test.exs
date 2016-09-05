defmodule Ctest.FieldValueTest do
  use Ctest.ModelCase

  alias Ctest.FieldValue

  @valid_attrs %{value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FieldValue.changeset(%FieldValue{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FieldValue.changeset(%FieldValue{}, @invalid_attrs)
    refute changeset.valid?
  end
end
