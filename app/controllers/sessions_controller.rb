class SessionsController < ApplicationController
  def create
    user_data = request.env['omniauth.auth']
    session[:user_id] = user_data.uid
    user = User.find_or_create_by(spotify_id: user_data.uid)
    user.username = user_data.info[:display_name]
    user.token = user_data.credentials[:token]
    user.email = user_data.info[:email]
    user.spotify_id = user_data.uid
    user.save
    if user.confirmed?
      # if user.two_factor == 1
      #   user.send_two_factor_email
      #   redirect_to '/'
      #   flash[:alert] = 'Please click the link in your email to finish signing in'
      # else
        service = GenieService.new(user)
        service.create_user
        session[:user_id] = user.spotify_id
        redirect_to '/dashboard'
      # end
    else
      user.send_confirmation_email
      redirect_to '/'
      flash[:alert] = 'Please activate your account by following the
      instructions in the account confirmation email you received to proceed'
    end
  end
end
