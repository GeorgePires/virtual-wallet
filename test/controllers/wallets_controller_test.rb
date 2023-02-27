require "test_helper"

class WalletsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wallets_index_url
    assert_response :success
  end

  test "should get show" do
    get wallets_show_url
    assert_response :success
  end

  test "should get credit" do
    get wallets_credit_url
    assert_response :success
  end

  test "should get debit" do
    get wallets_debit_url
    assert_response :success
  end

  test "should get transactions" do
    get wallets_transactions_url
    assert_response :success
  end
end
