class CreateMenuTags < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_tags do |t|
      t.string :tag_name

      t.timestamps
    end
  end
end
