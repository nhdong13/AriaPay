# frozen_string_literal: true

class RegisterInterestController < ApplicationController
  def create
    @register_interest = RegisterInterest.create(register_interest_params)
  end

  private

  def register_interest_params
    params.require(:register_interest).permit(
      :name,
      :email
    )
  end
end
