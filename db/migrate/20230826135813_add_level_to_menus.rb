class AddLevelToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :level, :integer
  end
end
