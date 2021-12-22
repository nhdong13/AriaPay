# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  def house?
    category_type.zero?
  end

  def apartment_block?
    category_type.zero?
  end
end
