# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    layout 'dashboard', only: %i(edit update)

    def after_update_path_for(_resource)
      edit_user_registration_path
    end  
  end
end
