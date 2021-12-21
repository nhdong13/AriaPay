# frozen_string_literal: true

class Estate < ApplicationRecord
  belongs_to :company
  has_one_attached :logo

  validates_presence_of :name, :address, :city, :postcode, :country, :latitude, :longitude

  def location
    [address, city, postcode, country].join(', ')
  end
end
