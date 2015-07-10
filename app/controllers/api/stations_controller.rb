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
        params.require(:station).permit(:name, :email, :password, :station_name,
          :phone_number, :address_1, :address_2, :city, :state, :zipcode)
      end

      # def promoter_logged_in?
      #   unless Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters"
      #     redirect_to sessions_login_path, notice: "Please login"
      #   end
      # end
  end
end
