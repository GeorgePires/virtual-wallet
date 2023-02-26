class User < ApplicationRecord
  after_create :create_wallet
  
  has_one :wallet

  validates :name, :email, presence: true
  
  def create_wallet
    wallet_number = (Digest::SHA1.hexdigest(SecureRandom.uuid)[0..7]).upcase
    unless Wallet.exists?(wallet_number: wallet_number)
      Wallet.create!(user_id: self.id, balance: 0.00, wallet_number: wallet_number)
    end
  end
end
