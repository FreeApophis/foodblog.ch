class CreateLocales < ActiveRecord::Migration[5.0]
  def change
    create_table :locales do |t|
      t.string :name
      t.string :english_name
      t.string :locale
      t.string :language_code
      t.string :country_code

      t.timestamps
    end
  end
end
