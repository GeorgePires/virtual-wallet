# frozen_string_literal: true

module ApplicationHelper
  def total
    Wallet.sum(:balance)
  end
end
