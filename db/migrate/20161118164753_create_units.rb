class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :abbrevation
      t.integer :category
      t.float :unit_factor

      t.timestamps    
    end
  end
end
