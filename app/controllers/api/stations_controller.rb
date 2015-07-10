module Api
  class StationsController < ApplicationController
    before_action :set_station, only: [:show, :promoters]
    respond_to :json
    before_action :promoter_logged_in?, only: [:index]

    def index
      @stations = Station.all
      respond_with @stations
    end

    def promoters
      respond_with @station.promoters
    end

    def show
      @promoters = Promoter.all
      respond_with @station
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_station
        @station = Station.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def station_params
        params.require(:station).permit(:name, :email, :password)
      end
  end
end
