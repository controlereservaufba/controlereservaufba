require 'test_helper'

class MilitarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @militar = militars(:one)
  end

  test "should get index" do
    get militars_url
    assert_response :success
  end

  test "should get new" do
    get new_militar_url
    assert_response :success
  end

  test "should create militar" do
    assert_difference('Militar.count') do
      post militars_url, params: { militar: { nome: @militar.nome, nome_guerra: @militar.nome_guerra, posto: @militar.posto } }
    end

    assert_redirected_to militar_url(Militar.last)
  end

  test "should show militar" do
    get militar_url(@militar)
    assert_response :success
  end

  test "should get edit" do
    get edit_militar_url(@militar)
    assert_response :success
  end

  test "should update militar" do
    patch militar_url(@militar), params: { militar: { nome: @militar.nome, nome_guerra: @militar.nome_guerra, posto: @militar.posto } }
    assert_redirected_to militar_url(@militar)
  end

  test "should destroy militar" do
    assert_difference('Militar.count', -1) do
      delete militar_url(@militar)
    end

    assert_redirected_to militars_url
  end
end
