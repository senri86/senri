class AddDetailsToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :lat, :float
    add_column :menus, :lng, :float
  end
end
