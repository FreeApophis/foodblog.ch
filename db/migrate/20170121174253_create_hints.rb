class CreateHints < ActiveRecord::Migration[5.0]
  def change
    create_table :hints do |t|
      t.string :text
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
