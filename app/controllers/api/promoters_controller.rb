module Api
  class PromotersController < ApplicationController
    before_action :set_promoter, only: [:show, :artists, :stations, :update, :requests]
    respond_to :json
    before_action :promoter_logged_in?, only: [:stations, :artists]
    before_action :logged_in?, only: [:show, :index]

    def index
      @promoters = Promoter.all
      respond_with :api, @promoters
    end

    def show
      respond_with :api, @promoter
    end

    def artists
      respond_with :api, @promoter.artists
    end

    def stations
      respond_with :api, @promoter.stations
    end

    def update
      @promoter.update(promoter_params)
      respond_with :api, @artist
    end

    def requests
      respond_with :api, @promoter.cd_request
      # @promoter.cd_request
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
