# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    property_manager_dashboard_path
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
