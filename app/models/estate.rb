# frozen_string_literal: true

class Estate < ApplicationRecord
  belongs_to :property_manager

  validates :name, presence: true
end
