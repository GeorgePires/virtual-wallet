# frozen_string_literal: true

module Api
  module V1
    class TransactionSerializer < ActiveModel::Serializer
      attributes :id, :transaction_type, :amount, :created_at

      belongs_to :wallet

      def created_at
        object.created_at.strftime('%d %b %Y at %T')
      end
    end
  end
end
