class AddLevelToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :level, :integer
  end
end
