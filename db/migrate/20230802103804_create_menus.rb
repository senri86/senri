class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :price
      t.string :address
      t.text :body

      t.timestamps
    end
  end
end
