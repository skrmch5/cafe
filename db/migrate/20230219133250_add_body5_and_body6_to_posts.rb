class AddBody5AndBody6ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body5, :string
    add_column :posts, :body6, :string
  end
end
