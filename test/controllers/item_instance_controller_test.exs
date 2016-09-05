defmodule Ctest.ItemInstanceControllerTest do
  use Ctest.ConnCase

  alias Ctest.ItemInstance
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, item_instance_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing item instances"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, item_instance_path(conn, :new)
    assert html_response(conn, 200) =~ "New item instance"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, item_instance_path(conn, :create), item_instance: @valid_attrs
    assert redirected_to(conn) == item_instance_path(conn, :index)
    assert Repo.get_by(ItemInstance, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, item_instance_path(conn, :create), item_instance: @invalid_attrs
    assert html_response(conn, 200) =~ "New item instance"
  end

  test "shows chosen resource", %{conn: conn} do
    item_instance = Repo.insert! %ItemInstance{}
    conn = get conn, item_instance_path(conn, :show, item_instance)
    assert html_response(conn, 200) =~ "Show item instance"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, item_instance_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    item_instance = Repo.insert! %ItemInstance{}
    conn = get conn, item_instance_path(conn, :edit, item_instance)
    assert html_response(conn, 200) =~ "Edit item instance"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    item_instance = Repo.insert! %ItemInstance{}
    conn = put conn, item_instance_path(conn, :update, item_instance), item_instance: @valid_attrs
    assert redirected_to(conn) == item_instance_path(conn, :show, item_instance)
    assert Repo.get_by(ItemInstance, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    item_instance = Repo.insert! %ItemInstance{}
    conn = put conn, item_instance_path(conn, :update, item_instance), item_instance: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit item instance"
  end

  test "deletes chosen resource", %{conn: conn} do
    item_instance = Repo.insert! %ItemInstance{}
    conn = delete conn, item_instance_path(conn, :delete, item_instance)
    assert redirected_to(conn) == item_instance_path(conn, :index)
    refute Repo.get(ItemInstance, item_instance.id)
  end
end
