module ApplicationHelper
  def active_link(action_path)
    'active' if request.path == action_path
  end
end
