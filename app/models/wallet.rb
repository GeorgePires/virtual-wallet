class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :user, :balance, presence: true
  validates :wallet_number, presence: true, uniqueness: true

  def credit(amount) 
    if amount > 0 
      ActiveRecord::Base.transaction do
        self.balance += amount
        save!
        transaction = transactions.create!(transaction_type: "credit", amount: amount)
        transaction
      end
    else
      raise "Invalid amount"
    end
  end

  def debit(amount)
    if self.balance >= amount
      ActiveRecord::Base.transaction do
        self.balance -= amount
        save!
        transaction = transactions.create!(transaction_type: "debit", amount: amount)
        transaction
      end
    else
      raise "Insufficient funds"
    end
  end
end
