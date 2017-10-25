class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
  #https://stackoverflow.com/questions/3995576/habtm-relationships-and-accepts-nested-attributes-for
  #Note: plural tagS
  validates_presence_of :name, :content
end
