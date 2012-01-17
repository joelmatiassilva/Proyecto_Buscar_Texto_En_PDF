require 'test_helper'

class PdfsControllerTest < ActionController::TestCase
  setup do
    @pdf = pdfs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pdfs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pdf" do
    assert_difference('Pdf.count') do
      post :create, pdf: @pdf.attributes
    end

    assert_redirected_to pdf_path(assigns(:pdf))
  end

  test "should show pdf" do
    get :show, id: @pdf.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pdf.to_param
    assert_response :success
  end

  test "should update pdf" do
    put :update, id: @pdf.to_param, pdf: @pdf.attributes
    assert_redirected_to pdf_path(assigns(:pdf))
  end

  test "should destroy pdf" do
    assert_difference('Pdf.count', -1) do
      delete :destroy, id: @pdf.to_param
    end

    assert_redirected_to pdfs_path
  end
end
