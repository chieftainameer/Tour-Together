class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :title
      t.string :description
      t.string :places
      t.string :services
      t.decimal :budget
      t.datetime :reg_date_ends
      t.string :pickup_spots

      t.timestamps
    end
  end
end
