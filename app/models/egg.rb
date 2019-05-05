class Egg < ActiveRecord::Base
  belongs_to :nest
  belongs_to :sparrow
end
