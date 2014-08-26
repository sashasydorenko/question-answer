class CreateApiQuestions < ActiveRecord::Migration
  def change
    create_table :api_questions do |t|
      t.string :status
      t.string :title
      t.text :body
      t.integer :comments_count
      t.references :category, index: true

      t.timestamps
    end
  end
end
