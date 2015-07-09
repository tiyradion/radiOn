module Api
  class PromotersController < ApplicationController
    before_action :set_promoter, only: [:show]
    respond_to :json

    def index
      @promoters = Promoter.all
      respond_with @promoters
    end

    def show
      respond_with @promoter
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_promoter
        @promoter = Promoter.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def promoter_params
        params.require(:promoter).permit(:name, :email, :password)
      end
  end
end
