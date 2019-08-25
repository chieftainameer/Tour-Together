class ChangeDescriptionTypeInTours < ActiveRecord::Migration[5.2]
  def change
  	change_column :tours, :description, :text
  end
end
