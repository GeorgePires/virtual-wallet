class HomeController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
    @transactions = Transaction.all
    @total_wallets_balance = Wallet.sum(:balance)
  end
end
