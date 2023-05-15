# frozen_string_literal: true

class WalletsController < ApplicationController
  layout 'home'
  before_action :authenticate_admin!
  before_action :set_wallet_and_user, only: %i[show credit create_credit debit create_debit transactions]

  def show; end
  def credit; end
  def debit; end

  def create_credit
    amount = params[:amount].to_f
    begin
      redirect_to user_path(@user), notice: "Credit of $ #{amount} was successful." if @wallet.credit(amount)
    rescue StandardError => e
      redirect_to user_path(@user), alert: "Credit of $ #{amount} was unsuccessful: #{e.message}"
    end
  end

  def create_debit
    amount = params[:amount].to_d
    begin
      redirect_to user_path(@user), notice: "Debit of $ #{amount} was successful." if @wallet.debit(amount)
    rescue StandardError => e
      redirect_to user_path(@user), alert: "Debit of $ #{amount} was unsuccessful: #{e.message}"
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
