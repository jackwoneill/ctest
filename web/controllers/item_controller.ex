defmodule Ctest.ItemController do
  use Ctest.Web, :controller

  alias Ctest.Item
  alias Ctest.ItemInstance

  def index(conn, _params) do
    items = Repo.all(Item)
    render(conn, "index.html", items: items)
  end

  def new(conn, _params) do
    changeset = Item.changeset(%Item{categories: [%Ctest.Category{}]})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    cats = (item_params["categories"])

    IO.inspect(cats)
    for {k, v} <- cats do 
      Map.put(v, "item_id", "1")
    end

    IO.inspect(cats)

    #inner = Map.put(Map.fetch!(cats, "0"), "item_id", "1")
    #d = Map.put(cats, "0", inner)
    d = Enum.map(cats, fn {k, v} -> Map.put(v, "item_id", "1") end)

    e = Map.put(item_params, "categories", cats)


    #item_params["categories"] = cats
    changeset = Item.changeset(%Item{}, e)
    IO.inspect(changeset)

    case Repo.insert(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    # category_changeset = Ctest.Category.changeset(%Ctest.Category{}, item_params["categories"])
    # item_changeset = Item.changeset(%Item{categories: category_changeset}, item_params)

    # if item_changeset.valid? do
    #   Repo.transaction fn ->
    #     item = Repo.insert!(item_changeset)
    #     category = Ecto.Model.build(item, :category)
    #     Repo.insert!(category)
    # end
    #   redirect conn, to: item_path(conn, :index)
    # else
    #   render conn, "new.html", changeset: item_changeset
    # end









  end

  def show(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    render(conn, "show.html", item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)
    changeset = Item.changeset(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Repo.get!(Item, id)
    changeset = Item.changeset(item, item_params)

    case Repo.update(changeset) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: item_path(conn, :show, item))
      {:error, changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get!(Item, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: item_path(conn, :index))
  end

  def new_instance(conn, %{"id" => id}) do

    item = Repo.get!(Item, id)
    #|> Repo.preload(categories: :fields)
    |> Repo.preload(categories: :fields)

    #Repo.preload item.categories, :fields

    categories = item.categories

    IO.puts("lmao")


    #cats = Repo.all(Ctest.Item) |> Enum.map(&{&1.name, &1.id})
    #cats = item |> Enum.map(&{&1.categories, &1.id})

    for cat <- item.categories do
      a = (cat.fields)
      b = Enum.at(a, 0)
      IO.puts(b.name)
    end

    c = Counter.new

    changeset = ItemInstance.changeset(%ItemInstance{field_values: [%Ctest.FieldValue{}], item_id: 0})
    #items = Repo.all(Ctest.Item) |> Enum.map(&{&1.name, &1.id})

    render(conn, "newinstance.html", changeset: changeset, id: id, item: item, categories: categories, counter: c)
  end

end
