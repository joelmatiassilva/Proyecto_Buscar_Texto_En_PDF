require 'test_helper'

class BusquedaContenidoControllerTest < ActionController::TestCase
  test "should get buscar_contenido" do
    get :buscar_contenido
    assert_response :success
  end

end
