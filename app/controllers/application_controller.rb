class ApplicationController < ActionController::Base
  include ControllerAuthentication
  helper :layout
  protect_from_forgery
  before_filter :check_uri if Rails.env.production?
  force_ssl
  
  private
  
  def check_uri
    if !/^www/.match(request.host)
      redirect_to "https://www.whereiring.com" + request.path
    end
  end
end
