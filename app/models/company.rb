class Company < ApplicationRecord
  has_many :property_managers, dependent: :destroy
end
