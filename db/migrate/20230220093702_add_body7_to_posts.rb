class AddBody7ToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :body7, :string
  end
end
