# frozen_string_literal: true

module PropertyManagers
  class EstatesController < BaseController
    def index
      @estate = Estate.new
    end

    def create; end
  end
end
