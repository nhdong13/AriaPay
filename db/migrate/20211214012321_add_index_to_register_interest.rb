class AddIndexToRegisterInterest < ActiveRecord::Migration[6.1]
  def change
    add_index :register_interests, :email, unique: true
  end
end
