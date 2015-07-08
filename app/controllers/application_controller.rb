class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def station_logged_in?
    unless Station.find_by_id(session[:user_id]) && session[:user_type] == "stations" do
      redirect_to sessions_login_path, notice: "Please login"
    end
  end

  def promoter_logged_in?
    unless Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters" do
      redirect_to sessions_login_path, notice: "Please login"
    end
  end

  def logged_in?
    if session[:user_type] == "stations"
      @station = Station.find_by_id(session[:user_id])
    elsif session[:user_type] == "promoters"
      @promoter = Promoter.find_by_id(session[:user_id])
    else
      respond_to sessions_login_path, notice: "Please login"
    end
  end
end
