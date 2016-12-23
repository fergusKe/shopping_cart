class AddItemCate < ActiveRecord::Migration
  def change
    add_column :items, :cate_id, :integer
  end
end
