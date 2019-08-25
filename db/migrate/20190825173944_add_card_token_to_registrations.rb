class AddCardTokenToRegistrations < ActiveRecord::Migration[5.2]
  def change
    add_column :registrations, :card_token, :string
  end
end
