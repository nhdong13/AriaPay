# frozen_string_literal: true

module AdminUsers
  class PropertyManagersController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_admin_user!

    def index; end
  end
end
