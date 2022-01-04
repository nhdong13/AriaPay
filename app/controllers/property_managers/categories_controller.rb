# frozen_string_literal: true

module PropertyManagers
  class CategoriesController < BaseController
    def create
      category = current_user.company.categories.create(category_params)

      if category.persisted?
        flash[:success] = 'Category created successfully!'
      else
        flash[:error] = category.errors.full_messages.join('. ')
      end

      redirect_to property_managers_estate_path(params[:estate_id])
    end

    private

    def category_params
      params.require(:category).permit(:name, :category_type)
    end
  end
end
