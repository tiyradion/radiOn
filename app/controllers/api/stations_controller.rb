module Api
  class StationsController < ApplicationController
    before_action :set_station, only: [:show, :promoters]
    respond_to :json
    # before_action :promoter_logged_in?, only: [:index]

    def index
      @stations = Station.all
      respond_with @stations
    end

    def promoters
      respond_with @station
    end

    def show
      respond_with @station
    end

    private
      def set_station
        @station = Station.find(params[:id])
      end

      def station_params
        params.require(:station).permit(:name, :email, :password, :station_name,
          :phone_number, :address_1, :address_2, :city, :state, :zipcode)
      end
  end
end
