class SessionsController < ApplicationController
  def login
    if request.post?
      if user = Station.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "stations"
          session[:user_name] = user.name
          redirect_to root_url
        else
          flash.now[:notice] = "User and Password do not match our records."
        end
      elsif user = Promoter.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          session[:user_type] = "promoters"
          session[:user_name] = user.name
          redirect_to root_url
        else
          flash.now[:notice] = "User and Password do not match our records."
        end
      else
        flash.now[:notice] = "Please login"
      end
    end
  end

  def logout
    session[:user_id]= nil
    session[:user_type]=nil
    redirect_to sessions_login_path, notice: "Logout Successful"
  end
end
