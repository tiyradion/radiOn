module Api
  class PromotersController < ApplicationController
    before_action :set_promoter, only: [:show, :artists, :stations, :update]
    respond_to :json

    def index
      @promoters = Promoter.all
      respond_with @promoters
    end

    def show
      respond_with @promoter
    end

    def artists
      respond_with @promoter.artists
    end

    def stations
      respond_with @promoter.stations
    end

    def update
      @promoter.update(promoter_params)
      respond_with :api, @artist
    end

    private
      def set_promoter
        @promoter = Promoter.find(params[:id])
      end

      def promoter_params
        params.require(:promoter).permit(:name, :email, :password, :company_name, :phone_number, :picture_upload, station_ids: [])
      end
  end
end
