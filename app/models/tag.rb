class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_uniqueness_of :name
  #validation requires the following reject_if add onto accepts_nested_attributes for post model
  #  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes['name'].blank? }
end
