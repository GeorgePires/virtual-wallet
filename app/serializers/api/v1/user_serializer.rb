# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :name, :email, :wallet

      has_one :wallet

      def wallet
        {
          wallet_id: object.wallet.id,
          current_balance: object.wallet.balance
        }
      end
    end
  end
end
