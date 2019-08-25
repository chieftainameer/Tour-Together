class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :integer
    add_column :users, :dob_month, :string
    add_column :users, :dob_day, :string
    add_column :users, :dob_year, :string
  end
end
