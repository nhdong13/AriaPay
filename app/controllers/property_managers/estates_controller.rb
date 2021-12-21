# frozen_string_literal: true

module PropertyManagers
  class EstatesController < BaseController
    def index
      @estate = Estate.new
      @estates = current_user.company.estates
    end

    def show 
      @estate = Estate.find(params[:id])
    end

    def create
      estate = current_user.company.estates.create(estate_params)

      if estate.persisted?
        flash[:success] = 'Estate created successfully!'
      else
        flash[:error] = estate.errors.full_messages.join('. ')
      end

      redirect_to property_managers_estates_path
    end

    private

    def estate_params
      params.require(:estate).permit(:name, :address, :city, :postcode, :country, :latitude, :longitude, :logo)
    end
  end
end
