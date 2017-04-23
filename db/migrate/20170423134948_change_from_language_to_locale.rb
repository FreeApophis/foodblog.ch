class ChangeFromLanguageToLocale < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :locale, index: true
    add_foreign_key :users, :locale

    remove_foreign_key :users, :language
    remove_reference :users, :language
  end
end
