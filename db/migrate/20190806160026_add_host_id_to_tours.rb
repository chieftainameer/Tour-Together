class AddHostIdToTours < ActiveRecord::Migration[5.2]
  def change
    add_column :tours, :host_id, :integer
  end
end
