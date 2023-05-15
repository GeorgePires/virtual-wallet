# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :check_user, only: %i[transactions current_balance]

      def index
        @users = User.all
        render json: @users, each_serializer: Api::V1::UserSerializer
      end

      def transactions
        @wallet = @user.wallet
        @transactions = @wallet.transactions.order(created_at: :desc)

        render json: @transactions
      end

      def current_balance
        render json: @user, each_serializer: Api::V1::UserSerializer
      end

      private

      def check_user
        @user = User.find_by(id: params[:id])
        return @user if @user.present?

        render json: { message: 'User not found' }, status: :not_found
      end
    end
  end
end
