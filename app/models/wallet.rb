# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :balance, presence: true
  validates :wallet_number, presence: true, uniqueness: true

  def credit(amount)
    raise 'Invalid amount' unless amount.positive?

    ActiveRecord::Base.transaction do
      self.balance += amount
      save!
      transaction = transactions.create!(transaction_type: 'credit', amount:)
      transaction
    end
  end

  def debit(amount)
    raise 'Invalid amount' unless amount.positive?
    raise 'Insufficient funds' unless self.balance >= amount

    ActiveRecord::Base.transaction do
      self.balance -= amount
      save!
      transaction = transactions.create!(transaction_type: 'debit', amount:)
      transaction
    end
  end
end
