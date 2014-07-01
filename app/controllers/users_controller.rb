class UsersController < ApplicationController
  skip_before_filter :gather_registration_details, only: [:register]

  def email
    if request.post?
      user = User.create(email: params[:email])

      redirect_to root_path, notice: "Thanks! #{user.email} has been succesfully added to our mailing list."
    end
  end

  def register
    @unregistered = !current_user.registered?
    if request.put?
      current_user.update_attributes(user_params)

      redirect_to root_path, notice: "Thanks for registering!" if @unregistered && current_user.registered?
    end
  end

  private

  def user_params
    params.require(:user).
      permit(:attending,
             :heard_about_by,
             :first_time_attendee,
             :shirt_size)
  end
end
