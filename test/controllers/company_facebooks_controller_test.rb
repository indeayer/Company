require 'test_helper'

class CompanyFacebooksControllerTest < ActionController::TestCase
  setup do
    @company_facebook = company_facebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_facebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_facebook" do
    assert_difference('CompanyFacebook.count') do
      post :create, company_facebook: { company_description: @company_facebook.company_description, company_name: @company_facebook.company_name, f_likes: @company_facebook.f_likes, f_url: @company_facebook.f_url, fid: @company_facebook.fid }
    end

    assert_redirected_to company_facebook_path(assigns(:company_facebook))
  end

  test "should show company_facebook" do
    get :show, id: @company_facebook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_facebook
    assert_response :success
  end

  test "should update company_facebook" do
    patch :update, id: @company_facebook, company_facebook: { company_description: @company_facebook.company_description, company_name: @company_facebook.company_name, f_likes: @company_facebook.f_likes, f_url: @company_facebook.f_url, fid: @company_facebook.fid }
    assert_redirected_to company_facebook_path(assigns(:company_facebook))
  end

  test "should destroy company_facebook" do
    assert_difference('CompanyFacebook.count', -1) do
      delete :destroy, id: @company_facebook
    end

    assert_redirected_to company_facebooks_path
  end
end
