# frozen_string_literal: true

module Api
  module V1
    class WalletsController < ApplicationController
      skip_before_action :verify_authenticity_token
      before_action :check_user, only: %i[credit debit]

      respond_to :json

      def credit
        @wallet = @user.wallet
        amount = params[:amount].to_f
        begin
          render json: @wallet.credit(amount)
        rescue StandardError => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      def debit
        @wallet = @user.wallet
        amount = params[:amount].to_f
        begin
          render json: @wallet.debit(amount)
        rescue StandardError => e
          render json: { error: e.message }, status: :unprocessable_entity
        end
      end

      private

      def check_user
        @user = User.find_by(id: params[:user_id])
        return @user if @user.present?

        render json: { message: 'User not found' }, status: :not_found
      end
    end
  end
end
