class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
end


# Whenever a new  tag  and post gets created it gets added to a join table based on that we can call has many 
