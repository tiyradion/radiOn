class DashboardController < ApplicationController
  before_action :logged_in?

  def home
  end

  # def logged_in?
  #   if Station.find_by_id(session[:user_id]) && session[:user_type] == "station"
  #     @station = Station.find_by_id(session[:user_id])
  #   elsif Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoter"
  #     @promoter = Promoter.find_by_id(session[:user_id])
  #   else
  #     redirect_to sessions_login_path, notice: "Please login"
  #   end
  # end
end
