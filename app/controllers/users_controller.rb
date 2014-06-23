class UsersController < ApplicationController
  skip_before_filter :gather_registration_details, only: [:register]

  def email
    if request.post?
      user = User.create(email: params[:email])

      redirect_to root_path, notice: "Thanks! #{user.email} has been succesfully added to our mailing list."
    end
  end

  def register
    if request.post?

    end
  end
end
