defmodule Ctest.ItemInstanceController do
  use Ctest.Web, :controller

  alias Ctest.ItemInstance

  def index(conn, _params) do
    item_instances = Repo.all(ItemInstance) |> Repo.preload(:item)
    render(conn, "index.html", item_instances: item_instances)
  end

  def new(conn, _params) do
    changeset = ItemInstance.changeset(%ItemInstance{})

    items = Repo.all(Ctest.Item) |> Enum.map(&{&1.name, &1.id})

    categories = Ctest.Repo.all(  
      from c in Ctest.Category,
       where: c.item_id == 1,
      select: c.name
    )

    render(conn, "new.html", changeset: changeset, items: items, categories: categories)
  end

  #def create(conn, %{"item_instance" => item_instance_params}) do
    #*%{"item_id" => item_id},*# 
  def create(conn, %{"item_instance" => item_instance_params, "item_id" => item_id}) do
    item_instance_params = Map.put(item_instance_params,
         "item_id", item_id)

    changeset = ItemInstance.changeset(%ItemInstance{}, item_instance_params)



    case Repo.insert(changeset) do
      {:ok, _item_instance} ->
        conn
        |> put_flash(:info, "Item instance created successfully.")
        |> redirect(to: item_instance_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item_instance = Repo.get!(ItemInstance, id) 
      |> Repo.preload(:item)
      |> Repo.preload(:field_values)
      |> Repo.preload(item: :categories)
      |> Repo.preload(item: [categories: :fields])
      #|> Repo.preload(item: [categories: [fields: :field_values]])
      |> Repo.preload(item: [categories: [fields: [field_values: from(v in Ctest.FieldValue, where: v.item_instance_id == ^id)]]])


    item = item_instance.item
    cats = item_instance.item.categories
    IO.puts("pre")


    map = Map.new(cats, fn x -> {x, x.fields} end)
    IO.inspect map
    #IO.inspect(cats)


    render(conn, "show.html", item_instance: item_instance, map: map)
  end

  def edit(conn, %{"id" => id}) do
    item_instance = Repo.get!(ItemInstance, id)
    changeset = ItemInstance.changeset(item_instance)
    render(conn, "edit.html", item_instance: item_instance, changeset: changeset)
  end

  def update(conn, %{"id" => id, "item_instance" => item_instance_params}) do
    item_instance = Repo.get!(ItemInstance, id)
    changeset = ItemInstance.changeset(item_instance, item_instance_params)

    case Repo.update(changeset) do
      {:ok, item_instance} ->
        conn
        |> put_flash(:info, "Item instance updated successfully.")
        |> redirect(to: item_instance_path(conn, :show, item_instance))
      {:error, changeset} ->
        render(conn, "edit.html", item_instance: item_instance, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item_instance = Repo.get!(ItemInstance, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(item_instance)

    conn
    |> put_flash(:info, "Item instance deleted successfully.")
    |> redirect(to: item_instance_path(conn, :index))
  end
end
