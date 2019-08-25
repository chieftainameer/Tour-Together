class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :body
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
