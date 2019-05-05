class CreateNestMaterials < ActiveRecord::Migration
  def change
    create_table :nest_materials do |t|
      t.belongs_to :nest, index: true, foreign_key: true
      t.belongs_to :material, index: true, foreign_key: true
    end
  end
end
