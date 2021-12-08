# frozen_string_literal: true

class RegisterInterest < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
end
