class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      cookies.signed[:auth_token] = {
        :value => user.auth_token,
        :expires => 7.days.from_now.utc
      }
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "You have been logged out."
  end
end
