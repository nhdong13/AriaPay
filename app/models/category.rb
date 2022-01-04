# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :company

  validates_presence_of :name, :category_type

  def house?
    category_type.zero?
  end

  def apartment_block?
    !category_type.zero?
  end
end
