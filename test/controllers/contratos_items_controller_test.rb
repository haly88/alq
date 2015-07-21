require 'test_helper'

class ContratosItemsControllerTest < ActionController::TestCase
  setup do
    @contratos_item = contratos_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contratos_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contratos_item" do
    assert_difference('ContratosItem.count') do
      post :create, contratos_item: { contrato_id: @contratos_item.contrato_id, fecha_desde: @contratos_item.fecha_desde, fecha_hasta: @contratos_item.fecha_hasta, monto: @contratos_item.monto }
    end

    assert_redirected_to contratos_item_path(assigns(:contratos_item))
  end

  test "should show contratos_item" do
    get :show, id: @contratos_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contratos_item
    assert_response :success
  end

  test "should update contratos_item" do
    patch :update, id: @contratos_item, contratos_item: { contrato_id: @contratos_item.contrato_id, fecha_desde: @contratos_item.fecha_desde, fecha_hasta: @contratos_item.fecha_hasta, monto: @contratos_item.monto }
    assert_redirected_to contratos_item_path(assigns(:contratos_item))
  end

  test "should destroy contratos_item" do
    assert_difference('ContratosItem.count', -1) do
      delete :destroy, id: @contratos_item
    end

    assert_redirected_to contratos_items_path
  end
end
