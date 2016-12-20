class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :comment, null: false
      t.references :commentable, polymorphic: true, index: true

     t.timestamps null: false
    end
  end
end
