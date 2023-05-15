# frozen_string_literal: true

class User < ApplicationRecord
  after_create :create_wallet

  has_one :wallet, dependent: :destroy

  validates :name, :email, presence: true

  def create_wallet
    wallet_number = (Digest::SHA1.hexdigest(SecureRandom.uuid)[0..7]).upcase
    return if Wallet.exists?(wallet_number:)

    Wallet.create!(user_id: id, balance: 0.00, wallet_number:)
  end
end
