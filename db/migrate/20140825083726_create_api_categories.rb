class CreateApiCategories < ActiveRecord::Migration
  def change
    create_table :api_categories do |t|
      t.string :name
      t.integer :count

      t.timestamps
    end
  end
end
