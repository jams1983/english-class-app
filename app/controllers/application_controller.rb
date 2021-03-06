class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      '/admin'
    elsif resource.is_a?(Teacher)
      groups_path
    else
      groups_path
    end
  end

  def current_user_groups
    current_user.groups.includes(:students)
  end
end
