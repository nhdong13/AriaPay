# frozen_string_literal: true

class PropertyManager < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :estates

  scope :search, lambda { |term|
    joins(:user, :company)
      .where('first_name ILIKE :term OR last_name ILIKE :term OR email ILIKE :term OR name ILIKE :term',
             term: "%#{term}%")
  }

  scope :order_by_name, -> { joins(:user).order(:first_name) }

  scope :order_by_email, -> { joins(:user).order(:email) }

  scope :order_by_company, -> { joins(:company).order(:name) }
end
