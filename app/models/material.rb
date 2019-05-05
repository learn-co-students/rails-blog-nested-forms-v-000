class Material < ActiveRecord::Base
  has_many :nest_materials
  has_many :nests, :through => :nest_materials
end
