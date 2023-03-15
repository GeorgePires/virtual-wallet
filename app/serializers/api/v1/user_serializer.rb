class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :wallet

  has_one :wallet

  def wallet
    {
      wallet_id: self.object.wallet.id,
      current_balance: self.object.wallet.balance
    }
  end
end


