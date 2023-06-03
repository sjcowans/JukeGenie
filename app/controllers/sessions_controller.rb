class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
  
    redirect_to dashboard_path
  end
end