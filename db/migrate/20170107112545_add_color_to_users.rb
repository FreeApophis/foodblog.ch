class AddColorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :color, :integer, null: false, default: 0
  end
end
