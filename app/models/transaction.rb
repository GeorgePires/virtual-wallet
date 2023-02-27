class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :amount, presence: true
end
