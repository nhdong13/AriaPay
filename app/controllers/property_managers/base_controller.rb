# frozen_string_literal: true

module PropertyManagers
  class BaseController < ::ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!
  end
end
