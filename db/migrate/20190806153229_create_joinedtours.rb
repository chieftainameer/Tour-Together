class CreateJoinedtours < ActiveRecord::Migration[5.2]
  def change
    create_table :joinedtours do |t|
      t.integer :user_id
      t.integer :tour_id

      t.timestamps
    end
  end
end
