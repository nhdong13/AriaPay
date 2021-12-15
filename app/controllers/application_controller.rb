# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    if resource.instance_of?(AdminUser)
      # first, sign out current_user, if signed in
      sign_out current_user if current_user

      admin_users_property_managers_path
    elsif resource.instance_of?(User)
      # first, sign out current_admin_user, if signed in
      sign_out current_admin_user if current_admin_user

      property_managers_dashboard_path
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
