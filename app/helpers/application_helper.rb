module ApplicationHelper
  def total
    Wallet.sum(:balance)
  end
end
