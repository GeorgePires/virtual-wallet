class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show edit update destroy ]

  def index
    @wallets = Wallet.all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_params
      params.require(:wallet).permit(:balance, :wallet_number, :user_id)
    end
end
