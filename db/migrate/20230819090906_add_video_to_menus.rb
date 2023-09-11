class AddVideoToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :video, :string
  end
end
