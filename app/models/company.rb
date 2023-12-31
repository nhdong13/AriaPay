# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :property_managers, dependent: :destroy
  has_many :estates, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
end
