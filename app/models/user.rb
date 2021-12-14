# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :property_manager, dependent: :destroy
  

  def full_name
    [first_name.to_s, last_name.to_s].join(' ')
  end
end
