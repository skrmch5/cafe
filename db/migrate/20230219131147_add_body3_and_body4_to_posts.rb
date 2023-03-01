class AddBody3AndBody4ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body3, :string
    add_column :posts, :body4, :string
  end
end
