class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
  
  
    require 'pry'; binding.pry
    redirect_to dashboard_path
  end
end