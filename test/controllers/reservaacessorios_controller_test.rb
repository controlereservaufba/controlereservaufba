require 'test_helper'

class ReservaacessoriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservaacessorio = reservaacessorios(:one)
  end

  test "should get index" do
    get reservaacessorios_url
    assert_response :success
  end

  test "should get new" do
    get new_reservaacessorio_url
    assert_response :success
  end

  test "should create reservaacessorio" do
    assert_difference('Reservaacessorio.count') do
      post reservaacessorios_url, params: { reservaacessorio: { id_acessorio: @reservaacessorio.id_acessorio, id_reserva: @reservaacessorio.id_reserva, qtd_acessorio: @reservaacessorio.qtd_acessorio, serie: @reservaacessorio.serie } }
    end

    assert_redirected_to reservaacessorio_url(Reservaacessorio.last)
  end

  test "should show reservaacessorio" do
    get reservaacessorio_url(@reservaacessorio)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservaacessorio_url(@reservaacessorio)
    assert_response :success
  end

  test "should update reservaacessorio" do
    patch reservaacessorio_url(@reservaacessorio), params: { reservaacessorio: { id_acessorio: @reservaacessorio.id_acessorio, id_reserva: @reservaacessorio.id_reserva, qtd_acessorio: @reservaacessorio.qtd_acessorio, serie: @reservaacessorio.serie } }
    assert_redirected_to reservaacessorio_url(@reservaacessorio)
  end

  test "should destroy reservaacessorio" do
    assert_difference('Reservaacessorio.count', -1) do
      delete reservaacessorio_url(@reservaacessorio)
    end

    assert_redirected_to reservaacessorios_url
  end
end
