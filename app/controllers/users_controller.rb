class UsersController < ApplicationController
  def show
    @user = User.find_by_spotify_id(session[:user_id])
    service = GenieService.new(@user.id)
    response = service.hosted_playlists
    formatted_response = JSON.parse(response.body, symbolize_names: true)
    @hosted_playlists = formatted_response[:hosted_playlists]
    @joined_playlists = formatted_response[:joined_playlists]
    if @user.nil?
      redirect_to '/'
      flash[:alert] = "You need to sign in, yo!"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_confirmation_email
      flash[:success] = "Please confirm your email address to continue"
      redirect_to '/dashboard'
    else
      flash[:error] = "Ooooppss, something went wrong!"
      redirect_to new_user_path
    end
  end

  def new
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:confirmation_token])
    if @user
      @user.email_activate
      flash.now.alert = "Welcome to Juke Genie!"
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to '/'
    end
  end

  def update
    @user = User.find_by(params[:user])
    if params[:two_factor]
      @user.add_two_factor
      redirect_to '/dashboard'
      flash[:success] = "2 Factor Acticated!"
    elsif params[:no_two_factor]
      @user.remove_two_factor
      redirect_to '/dashboard'
      flash[:success] = "2 Factor Deactivated!"
    else
      flash[:alert] = "Error"
    end
  end
  
  def new
  end

  def requests
  end

  private 
  
  def user_params
    params.permit(:username, :email, :token, :role, :spotify_id, :email_confirmed, :confirm_token, :password)
  end
end