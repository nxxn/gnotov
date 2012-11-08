class CreateWorks < ActiveRecord::Migration
  def up
    create_table :works do |t|
      t.string :url
      t.text :description
      t.boolean :show

      t.timestamps
    end
  end

  def down
    drop_table :works
  end
end
