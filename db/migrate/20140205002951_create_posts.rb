class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.string :title
      t.text :main_text
      t.boolean :show
      t.has_attached_file :picture

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
