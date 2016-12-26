class AddAvatarColorToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar_color, :integer, null: false, default: 0
    add_column :users, :description, :text
  end
end
