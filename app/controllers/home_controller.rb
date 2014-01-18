class HomeController < ApplicationController

  def index

  end

  def email
    Attendee.find_or_create_by_email(params[:email])
    render :index
  end

end
