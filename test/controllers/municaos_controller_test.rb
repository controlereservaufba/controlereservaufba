require 'test_helper'

class MunicaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @municao = municaos(:one)
  end

  test "should get index" do
    get municaos_url
    assert_response :success
  end

  test "should get new" do
    get new_municao_url
    assert_response :success
  end

  test "should create municao" do
    assert_difference('Municao.count') do
      post municaos_url, params: { municao: { calibre: @municao.calibre, descricao: @municao.descricao } }
    end

    assert_redirected_to municao_url(Municao.last)
  end

  test "should show municao" do
    get municao_url(@municao)
    assert_response :success
  end

  test "should get edit" do
    get edit_municao_url(@municao)
    assert_response :success
  end

  test "should update municao" do
    patch municao_url(@municao), params: { municao: { calibre: @municao.calibre, descricao: @municao.descricao } }
    assert_redirected_to municao_url(@municao)
  end

  test "should destroy municao" do
    assert_difference('Municao.count', -1) do
      delete municao_url(@municao)
    end

    assert_redirected_to municaos_url
  end
end
