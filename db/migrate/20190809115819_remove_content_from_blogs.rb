class RemoveContentFromBlogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :blogs, :content
  end
end
