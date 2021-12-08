# frozen_string_literal: true

class RegisterInterestController < ApplicationController
  def create
    register_interest = RegisterInterest.new(register_interest_params)
    @status = register_interest.save
  end

  private

  def register_interest_params
    params.require(:register_interest).permit(
      :name,
      :email
    )
  end
end
