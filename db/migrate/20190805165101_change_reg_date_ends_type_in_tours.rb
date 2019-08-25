class ChangeRegDateEndsTypeInTours < ActiveRecord::Migration[5.2]
  def change
  	change_column :tours, :reg_date_ends, :date
  end
end
