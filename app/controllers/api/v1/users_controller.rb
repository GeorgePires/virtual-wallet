class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[ show current_balance ]
  
  def index
    @users = User.all
    render json: @users, each_serializer: Api::V1::UserSerializer
  end

  def show
    @wallet = @user.wallet
    @transactions = @wallet.transactions.order(created_at: :desc)

    render json: @transactions
  end

  def current_balance
    render json: @user, each_serializer: Api::V1::UserSerializer
  end


  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
