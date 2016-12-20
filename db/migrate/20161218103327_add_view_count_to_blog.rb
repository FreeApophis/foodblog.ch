class AddViewCountToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :view_count, :integer, null: false, default: 0
  end
end
