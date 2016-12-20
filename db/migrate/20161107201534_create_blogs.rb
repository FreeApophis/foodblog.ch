class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :teaser
      t.text :text
      t.integer :author_id
      t.datetime :published_at

      t.timestamps
    end
  end
end
