# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @register_interest = RegisterInterest.new
  end
end
