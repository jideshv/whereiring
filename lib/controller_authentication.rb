# This module is included in your application controller which makes
# several methods available to all controllers and views. Here's a
# common example you might add to your application layout file.
#
#   <% if logged_in? %>
#     Welcome <%= current_user.username %>.
#     <%= link_to "Edit profile", edit_current_user_path %> or
#     <%= link_to "Log out", logout_path %>
#   <% else %>
#     <%= link_to "Sign up", signup_path %> or
#     <%= link_to "log in", login_path %>.
#   <% end %>
#
# You can also restrict unregistered users from accessing a controller using
# a before filter. For example.
#
#   before_filter :login_required, :except => [:index, :show]
module ControllerAuthentication
  def self.included(controller)
    controller.send :helper_method, :current_user, :logged_in?, :redirect_to_target_or_default, :store_target_location
  end

  def current_user
    @current_user = User.find_by_auth_token(cookies.signed[:auth_token]) if cookies.signed[:auth_token]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end
  
  def check_login_and_role(role)
    unless (logged_in?) && (@current_user.role) && (@current_user.role.include? role)
      redirect_to login_url, :alert => "You must login as a valid AXP12 SAC user."
    end
  end

  def redirect_to_target_or_default(default, *args)
    redirect_to(session[:return_to] || default, *args)
    session[:return_to] = nil
  end

  def store_target_location
    session[:return_to] = request.url
  end
end
