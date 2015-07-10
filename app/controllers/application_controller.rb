class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def station_logged_in?
    unless Station.find_by_id(session[:user_id]) && session[:user_type] == "station"
      redirect_to sessions_login_path, notice: "Please login"
    end
  end

  def promoter_logged_in?
    unless Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoter"
      redirect_to sessions_login_path, notice: "Please login"
    end
  end

  def logged_in?
    if Station.find_by_id(session[:user_id]) && session[:user_type] == "station"
      @station = Station.find_by_id(session[:user_id])
    elsif Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoter"
      @promoter = Promoter.find_by_id(session[:user_id])
    else
      redirect_to sessions_login_path, notice: "Please login"
    end
  # end
end
