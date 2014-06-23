class SessionsController < ApplicationController
  skip_before_filter :gather_registration_details, only: [:destroy]

  def new
    redirect_to root_path, notice: 'Already signed in!' if user_signed_in?
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_by_auth_hash(auth)

    session[:user_id] = user.id
    redirect_to root_path, notice: 'Signed in!'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end
end
