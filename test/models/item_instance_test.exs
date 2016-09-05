defmodule Ctest.ItemInstanceTest do
  use Ctest.ModelCase

  alias Ctest.ItemInstance

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ItemInstance.changeset(%ItemInstance{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ItemInstance.changeset(%ItemInstance{}, @invalid_attrs)
    refute changeset.valid?
  end
end
