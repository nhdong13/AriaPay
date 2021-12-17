# frozen_string_literal: true

module PropertyManagers
  class DashboardController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!

    def index; end
  end
end
