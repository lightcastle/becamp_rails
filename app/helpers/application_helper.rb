module ApplicationHelper
  def active_link(action_path)
    'active' if request.path == action_path
  end

  def require_admin_user
    redirect_to root_path unless current_user.try(:admin?)
  end
end
