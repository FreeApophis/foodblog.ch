class AddLanguageToUser < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
      t.string :iso_639_1
      t.string :iso_639_2
      t.string :name

      t.timestamps
    end

    add_reference :users, :language, index: true
    add_foreign_key :users, :languages
  end
end
