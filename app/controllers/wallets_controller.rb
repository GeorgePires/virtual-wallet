class WalletsController < ApplicationController
  before_action :set_wallet_and_user, only: %i[ show credit create_credit debit create_debit transactions]

  def show; end
  def credit; end
  def debit; end

  def create_credit
    amount = params[:amount].to_f
    
    if amount > 0 
      @wallet.credit(amount)
      redirect_to users_path, notice: "Credit of #{amount} was successful." 
    else
      redirect_to users_path, alert: "Credit of #{amount} was unsuccessful."
    end
  end


  def create_debit
    amount = params[:amount].to_d

    begin
      if @wallet.debit(amount)
        redirect_to users_path, notice: "Debit of #{amount} was successful."
      end
    rescue StandardError => e
      redirect_to users_path, alert: "Debit of #{amount} was unsuccessful: #{e.message}"
    end
  end

  def transactions
    @transactions = @wallet.transactions.order(created_at: :desc)
  end
  
  private

    def set_wallet_and_user
      @user = User.find(params[:user_id])
      @wallet = @user.wallet
    end
end
