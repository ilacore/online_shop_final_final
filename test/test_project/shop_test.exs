defmodule TestProject.ShopTest do
  use TestProject.DataCase

  alias TestProject.Shop

  describe "items" do
    alias TestProject.Shop.Item

    @valid_attrs %{amount: 42, name: "some name"}
    @update_attrs %{amount: 43, name: "some updated name"}
    @invalid_attrs %{amount: nil, name: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shop.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Shop.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Shop.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Shop.create_item(@valid_attrs)
      assert item.amount == 42
      assert item.name == "some name"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Shop.update_item(item, @update_attrs)
      assert item.amount == 43
      assert item.name == "some updated name"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_item(item, @invalid_attrs)
      assert item == Shop.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Shop.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Shop.change_item(item)
    end
  end

  describe "orders" do
    alias TestProject.Shop.Order

    @valid_attrs %{customer: "some customer", phone: "some phone"}
    @update_attrs %{customer: "some updated customer", phone: "some updated phone"}
    @invalid_attrs %{customer: nil, phone: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shop.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert Shop.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert Shop.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = Shop.create_order(@valid_attrs)
      assert order.customer == "some customer"
      assert order.phone == "some phone"
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shop.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = Shop.update_order(order, @update_attrs)
      assert order.customer == "some updated customer"
      assert order.phone == "some updated phone"
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = Shop.update_order(order, @invalid_attrs)
      assert order == Shop.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = Shop.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> Shop.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = Shop.change_order(order)
    end
  end
end
