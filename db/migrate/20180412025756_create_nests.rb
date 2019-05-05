class CreateNests < ActiveRecord::Migration
  def change
    create_table :nests do |t|
      t.string :location
      t.belongs_to :sparrow, index: true, foreign_key: true
    end
  end
end
