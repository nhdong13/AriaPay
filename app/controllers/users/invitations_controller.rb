# frozen_string_literal: true

module Users
  class InvitationsController < Devise::InvitationsController
    before_action :update_sanitized_params, only: :update

    def update
      super
      update_property_manager_company(resource) if resource.invitation_accepted?
    end

    protected

    def update_sanitized_params
      devise_parameter_sanitizer.permit(:accept_invitation,
                                        keys: %i[first_name last_name password password_confirmation invitation_token
                                                 email])
    end

    def update_property_manager_company(user)
      return if user.try(:company).try(:name) == params[:company_name]

      company = Company.where(name: params[:company_name]).first_or_create
      user.update(company: company)
    end
  end
end
