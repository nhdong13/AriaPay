# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :property_managers, dependent: :destroy

  validates :name, presence: true
end
