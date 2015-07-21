require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { activo: @persona.activo, codigo: @persona.codigo, descripcion: @persona.descripcion, direccion: @persona.direccion, email: @persona.email, es_garante: @persona.es_garante, es_inquilino: @persona.es_inquilino, es_otro: @persona.es_otro, es_propietario: @persona.es_propietario, nombre: @persona.nombre, telefono: @persona.telefono }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { activo: @persona.activo, codigo: @persona.codigo, descripcion: @persona.descripcion, direccion: @persona.direccion, email: @persona.email, es_garante: @persona.es_garante, es_inquilino: @persona.es_inquilino, es_otro: @persona.es_otro, es_propietario: @persona.es_propietario, nombre: @persona.nombre, telefono: @persona.telefono }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
