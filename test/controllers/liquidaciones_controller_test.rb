require 'test_helper'

class LiquidacionesControllerTest < ActionController::TestCase
  setup do
    @liquidacion = liquidaciones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:liquidaciones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create liquidacion" do
    assert_difference('Liquidacion.count') do
      post :create, liquidacion: { comision: @liquidacion.comision, contrato_id: @liquidacion.contrato_id, descuento: @liquidacion.descuento, fecha: @liquidacion.fecha, neto: @liquidacion.neto, total: @liquidacion.total }
    end

    assert_redirected_to liquidacion_path(assigns(:liquidacion))
  end

  test "should show liquidacion" do
    get :show, id: @liquidacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @liquidacion
    assert_response :success
  end

  test "should update liquidacion" do
    patch :update, id: @liquidacion, liquidacion: { comision: @liquidacion.comision, contrato_id: @liquidacion.contrato_id, descuento: @liquidacion.descuento, fecha: @liquidacion.fecha, neto: @liquidacion.neto, total: @liquidacion.total }
    assert_redirected_to liquidacion_path(assigns(:liquidacion))
  end

  test "should destroy liquidacion" do
    assert_difference('Liquidacion.count', -1) do
      delete :destroy, id: @liquidacion
    end

    assert_redirected_to liquidaciones_path
  end
end
