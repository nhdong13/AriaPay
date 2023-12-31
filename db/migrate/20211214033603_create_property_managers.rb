class CreatePropertyManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :property_managers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
