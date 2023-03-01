class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :user, :balance, presence: true
  validates :wallet_number, presence: true, uniqueness: true

  def credit(amount)
    if amount > 0 
      self.balance += amount
      save
      transactions.create(transaction_type: "credit", amount: amount)
    else
      raise "Invalid amount"
    end
  end

  def debit(amount)
    if self.balance >= amount
      self.balance -= amount
      save
      transactions.create(transaction_type: "debit", amount: amount)
    else
      raise "Insufficient funds"
    end
  end
end
