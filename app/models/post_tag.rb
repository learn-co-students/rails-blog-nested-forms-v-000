class PostTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  validates_presence_of :tag_id


end
