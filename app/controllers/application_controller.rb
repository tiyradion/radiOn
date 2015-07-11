class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def station_logged_in?
    unless Station.find_by_id(session[:user_id]) && session[:user_type] == "stations"
      redirect_to sessions_login_path, notice: "Station login required, please login."
    end
  end

  def promoter_logged_in?
    unless Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters"
      redirect_to sessions_login_path, notice: "Promoter login required, please login."
    end
  end

  def logged_in?
    if Station.find_by_id(session[:user_id]) && session[:user_type] == "stations"
      @station = Station.find_by_id(session[:user_id])
    elsif Promoter.find_by_id(session[:user_id]) && session[:user_type] == "promoters"
      @promoter = Promoter.find_by_id(session[:user_id])
    else
      redirect_to sessions_login_path, notice: "Please login"
    end
  end
end
