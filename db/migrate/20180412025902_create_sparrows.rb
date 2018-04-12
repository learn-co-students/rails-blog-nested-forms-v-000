class CreateSparrows < ActiveRecord::Migration
  def change
    create_table :sparrows do |t|
      t.string :name
      t.string :species
    end
  end
end
