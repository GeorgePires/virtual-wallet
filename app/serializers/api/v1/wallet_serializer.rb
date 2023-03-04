class WalletSerializer < ActiveModel::Serializer
  attributes :id, :balance, :wallet_number, :user

  belongs_to :user
  has_many :transactions

  def user
    {
      user_id: self.object.user_id,
      username: self.object.user.name
    }
  end
end
