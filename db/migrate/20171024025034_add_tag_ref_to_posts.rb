class AddTagRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :tag, index: true
    add_foreign_key :posts, :tags
  end
end
