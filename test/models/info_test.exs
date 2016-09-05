defmodule Ctest.InfoTest do
  use Ctest.ModelCase

  alias Ctest.Info

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Info.changeset(%Info{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Info.changeset(%Info{}, @invalid_attrs)
    refute changeset.valid?
  end
end
