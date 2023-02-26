class Wallet < ApplicationRecord
  belongs_to :user

  validates :user, :balance, presence: true
  validates :wallet_number, presence: true, uniqueness: true
end
