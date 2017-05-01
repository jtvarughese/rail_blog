class AddColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :string
    add_column :posts, :date, :datetime
  end
end
