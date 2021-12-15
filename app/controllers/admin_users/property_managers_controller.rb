# frozen_string_literal: true

module AdminUsers
  class PropertyManagersController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_admin_user!
    before_action :set_property_managers, only: :index
    before_action :search_property_managers, only: :index
    before_action :sort_property_managers, only: :index

    def index
      @property_managers = @property_managers.includes(:user, :company).page(params[:page])
    end

    def invite
      if User.find_by(email: user_params[:email]).blank?
        user = User.invite!(user_params)
        company = Company.where(name: params[:company_name]).first_or_create
        user.build_property_manager(company: company)
        user.save
      end
      redirect_to admin_users_property_managers_path
    end

    private

    def user_params
      params.permit(:first_name, :last_name, :email)
    end

    def set_property_managers
      @property_managers = PropertyManager.all
    end

    def search_property_managers
      @property_managers = @property_managers.search(params[:term]) if params[:term].present?
    end

    def sort_property_managers
      return unless params[:order_by].present?

      @property_managers = case params[:order_by].downcase
                           when 'name'
                             @property_managers.order_by_name
                           when 'email'
                             @property_managers.order_by_email
                           when 'company'
                             @property_managers.order_by_company
                           end
    end
  end
end
