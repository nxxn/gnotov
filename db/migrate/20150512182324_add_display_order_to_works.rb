class AddDisplayOrderToWorks < ActiveRecord::Migration
  def change
    add_column :works, :display_order, :integer, default: 0
  end
end
