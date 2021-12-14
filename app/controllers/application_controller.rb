# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    if resource.class == AdminUser
      # first, sign out current_user, if signed in
      if current_user
        sign_out current_user
      end
      
      admin_users_property_managers_path
    elsif resource.class == User
      # first, sign out current_admin_user, if signed in
      if current_admin_user
        sign_out current_admin_user
      end
      
      property_manager_dashboard_path
    end
  end

  private

  def layout_by_resource
    return false if request.xhr?

    if devise_controller?
      'minimal'
    else
      'application'
    end
  end
end
