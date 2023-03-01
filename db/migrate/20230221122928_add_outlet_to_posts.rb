class AddOutletToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :outlet, :string
  end
end
