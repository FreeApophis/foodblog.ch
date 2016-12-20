class AddCommentCountToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :comments_count, :integer, null: false, default: 0
  end
end
