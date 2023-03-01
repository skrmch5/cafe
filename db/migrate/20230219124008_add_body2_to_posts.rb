class AddBody2ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body2, :string
  end
end
