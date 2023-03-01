class Transaction < ApplicationRecord
  belongs_to :wallet

  validates :amount, presence: true

  scope :credit , -> { where(transaction_type: 'credit').count }
  scope :debit , -> { where(transaction_type: 'debit').count }
end
