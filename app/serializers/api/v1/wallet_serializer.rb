# frozen_string_literal: true

module Api
  module V1
    class WalletSerializer < ActiveModel::Serializer
      attributes :id, :balance, :wallet_number, :user

      belongs_to :user
      has_many :transactions

      def user
        {
          user_id: object.user_id,
          username: object.user.name
        }
      end
    end
  end
end
