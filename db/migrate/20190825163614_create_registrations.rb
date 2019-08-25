class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.string :full_name
      t.string :email
      t.integer :telephone
      t.integer :user_id

      t.timestamps
    end
  end
end
