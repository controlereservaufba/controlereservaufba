require 'test_helper'

class ArmamentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armamento = armamentos(:one)
  end

  test "should get index" do
    get armamentos_url
    assert_response :success
  end

  test "should get new" do
    get new_armamento_url
    assert_response :success
  end

  test "should create armamento" do
    assert_difference('Armamento.count') do
      post armamentos_url, params: { armamento: { fabricante: @armamento.fabricante, modelo: @armamento.modelo, serie: @armamento.serie } }
    end

    assert_redirected_to armamento_url(Armamento.last)
  end

  test "should show armamento" do
    get armamento_url(@armamento)
    assert_response :success
  end

  test "should get edit" do
    get edit_armamento_url(@armamento)
    assert_response :success
  end

  test "should update armamento" do
    patch armamento_url(@armamento), params: { armamento: { fabricante: @armamento.fabricante, modelo: @armamento.modelo, serie: @armamento.serie } }
    assert_redirected_to armamento_url(@armamento)
  end

  test "should destroy armamento" do
    assert_difference('Armamento.count', -1) do
      delete armamento_url(@armamento)
    end

    assert_redirected_to armamentos_url
  end
end
