class ConfirmationsController < ApplicationController

  def edit
    @user = User.find_by_confirm_token(params[:confirmation_token])
    if @user
      @user.email_activate
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end