class CreateEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :estates do |t|
      t.string :name, null: false
      t.string :address
      t.string :city
      t.string :postcode
      t.string :country
      t.string :latitude
      t.string :longitude
      t.references :property_manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
