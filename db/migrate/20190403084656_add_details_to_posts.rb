class AddDetailsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :content, :text
    add_column :posts, :image, :text
  end
end
