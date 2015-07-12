module Api
  class StationsController < ApplicationController
    before_action :set_station, only: [:show, :promoters, :update]
    respond_to :json
    # before_action :promoter_logged_in?, only: [:index]
    before_action :logged_in?, only: [:index, :show]
    before_action :station_logged_in?, only: [:promoters]

    def index
      @stations = Station.all
      respond_with :api, @stations
    end

    def promoters
      respond_with :api, @station.promoters
    end

    def show
      respond_with :api, @station
    end

    def update
      @station.update(station_params)
      respond_with :api, @station
    end

    private
      def set_station
        @station = Station.find(params[:id])
      end

      def station_params
        params.require(:station).permit(:name, :email, :password, :station_name,
          :phone_number, :address_1, :address_2, :city, :state, :zipcode, promoter_ids: [])
      end
  end
end
