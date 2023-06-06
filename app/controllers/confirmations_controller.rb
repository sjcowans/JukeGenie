class ConfirmationsController < ApplicationController

  def edit
    @user = User.find_by_confirm_token(params[:confirmation_token])
    if @user
      @user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      Please sign in to continue."
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry. User does not exist"
      redirect_to '/'
    end
  end
end