class AddColumnsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :content, :string
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
  end
end
