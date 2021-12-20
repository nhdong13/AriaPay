# frozen_string_literal: true

class Estate < ApplicationRecord
  belongs_to :property_manager
  has_one_attached :logo

  validates :name, presence: true
end
