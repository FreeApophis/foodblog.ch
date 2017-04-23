class RemoveDefaultOnUserName < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:users, :name, nil)
  end
end
