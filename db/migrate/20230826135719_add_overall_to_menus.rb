class AddOverallToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :overall, :integer
  end
end
