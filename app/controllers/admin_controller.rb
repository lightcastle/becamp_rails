class AdminController < ApplicationController
  before_filter :require_admin_user
  skip_before_filter :gather_registration_details

  private

  def require_admin_user
    redirect_to root_path unless current_user.try(:admin?)
  end

end
