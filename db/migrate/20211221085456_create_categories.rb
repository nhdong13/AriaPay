class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :category_type, null: false, default: 0
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
