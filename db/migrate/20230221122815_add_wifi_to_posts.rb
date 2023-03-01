class AddWifiToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :wifi, :string
  end
end
