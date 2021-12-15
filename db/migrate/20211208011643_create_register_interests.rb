class CreateRegisterInterests < ActiveRecord::Migration[6.1]
  def change
    create_table :register_interests do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
