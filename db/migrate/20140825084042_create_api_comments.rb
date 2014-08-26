class CreateApiComments < ActiveRecord::Migration
  def change
    create_table :api_comments do |t|
      t.text :body
      t.references :question, index: true

      t.timestamps
    end
  end
end
