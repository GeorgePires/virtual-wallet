class WalletSerializer < ActiveModel::Serializer
  attributes :id, :balance, :wallet_number, :user_id

  belongs_to :user
  has_many :transactions
end
