class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :description
      t.belongs_to :nest, index: true, foreign_key: true
    end
  end
end
