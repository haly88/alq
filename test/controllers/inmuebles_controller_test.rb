require 'test_helper'

class InmueblesControllerTest < ActionController::TestCase
  setup do
    @inmueble = inmuebles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inmuebles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inmueble" do
    assert_difference('Inmueble.count') do
      post :create, inmueble: { activo: @inmueble.activo, adm_email: @inmueble.adm_email, adm_tel1: @inmueble.adm_tel1, adm_tel2: @inmueble.adm_tel2, adm_tel3: @inmueble.adm_tel3, administracion: @inmueble.administracion, codigo: @inmueble.codigo, codigo_postal: @inmueble.codigo_postal, depto: @inmueble.depto, descripcion: @inmueble.descripcion, direccion: @inmueble.direccion, enc_email: @inmueble.enc_email, enc_tel1: @inmueble.enc_tel1, enc_tel2: @inmueble.enc_tel2, enc_tel3: @inmueble.enc_tel3, encargado: @inmueble.encargado, inmueble_tipo_id: @inmueble.inmueble_tipo_id, localidad: @inmueble.localidad, piso: @inmueble.piso }
    end

    assert_redirected_to inmueble_path(assigns(:inmueble))
  end

  test "should show inmueble" do
    get :show, id: @inmueble
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inmueble
    assert_response :success
  end

  test "should update inmueble" do
    patch :update, id: @inmueble, inmueble: { activo: @inmueble.activo, adm_email: @inmueble.adm_email, adm_tel1: @inmueble.adm_tel1, adm_tel2: @inmueble.adm_tel2, adm_tel3: @inmueble.adm_tel3, administracion: @inmueble.administracion, codigo: @inmueble.codigo, codigo_postal: @inmueble.codigo_postal, depto: @inmueble.depto, descripcion: @inmueble.descripcion, direccion: @inmueble.direccion, enc_email: @inmueble.enc_email, enc_tel1: @inmueble.enc_tel1, enc_tel2: @inmueble.enc_tel2, enc_tel3: @inmueble.enc_tel3, encargado: @inmueble.encargado, inmueble_tipo_id: @inmueble.inmueble_tipo_id, localidad: @inmueble.localidad, piso: @inmueble.piso }
    assert_redirected_to inmueble_path(assigns(:inmueble))
  end

  test "should destroy inmueble" do
    assert_difference('Inmueble.count', -1) do
      delete :destroy, id: @inmueble
    end

    assert_redirected_to inmuebles_path
  end
end
