class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.string :color
      t.belongs_to :nest, index: true, foreign_key: true
      t.belongs_to :sparrow, index: true, foreign_key: true
    end
  end
end
