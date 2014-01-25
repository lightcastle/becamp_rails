class EmailController < ApplicationController

  def create
    email = Email.create(email: params[:email])

    redirect_to root_path, notice: "Thanks! #{email.email} has been succesfully added to our mailing list."
  end

end