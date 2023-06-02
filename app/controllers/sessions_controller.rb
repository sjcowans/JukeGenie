class SessionsController < ApplicationController
  def create
    require 'pry'; binding.pry
    # render text: request.env["omniauth.auth"].inspect

  end
end