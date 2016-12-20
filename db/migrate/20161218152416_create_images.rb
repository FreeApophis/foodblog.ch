class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :file, null: false
      t.string :name, null: false
      t.string :description
      t.integer :size, null: false

      t.timestamps
    end
  end
end
