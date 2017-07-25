class AdminController < ApplicationController
  before_filter :require_admin_user
  skip_before_filter :gather_registration_details
end
