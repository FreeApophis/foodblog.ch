class AddNameTouser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, default: "Noname"
  end
end
