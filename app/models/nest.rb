class Nest < ActiveRecord::Base
  belongs_to :sparrow
  has_many :eggs
  has_many :nest_materials
  has_many :materials, :through => :nest_materials
end
