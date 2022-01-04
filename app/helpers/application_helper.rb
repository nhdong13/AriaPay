# frozen_string_literal: true

module ApplicationHelper
  FLASH_CLASSES = {
    'notice' => 'alert-info',
    'success' => 'alert-success',
    'alert' => 'alert-danger',
    'error' => 'alert-danger'
  }.freeze

  def flash_class(level)
    FLASH_CLASSES[level]
  end

  def show_active_class(name = nil)
    'active' if controller_name == name
  end
end
