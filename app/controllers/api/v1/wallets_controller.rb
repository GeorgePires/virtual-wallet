class Api::V1::WalletsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_wallet_and_user, only: %i[ credit debit ]

  respond_to :json

  def credit
    amount = params[:amount].to_f
    begin
      render json: @wallet.credit(amount)
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  def debit
    amount = params[:amount].to_f
    begin
      render json: @wallet.debit(amount)
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def set_wallet_and_user
    @user = User.find(params[:user_id])
    @wallet = @user.wallet
  end
end
