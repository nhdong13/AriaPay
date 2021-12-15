# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, validate_on_invite: true

  has_one :property_manager, dependent: :destroy
  has_one :company, through: :property_manager

  validates_presence_of :first_name, :last_name

  def full_name
    [first_name.to_s, last_name.to_s].join(' ')
  end
end
