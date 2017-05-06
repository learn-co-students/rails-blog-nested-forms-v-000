class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  # accepts_nested_attributes_for :tags, reject_if: proc { |attrib| attrib['Name'].blank? }

  def tags_attributes=(tags_hash)
  	if !tags_hash.empty?
  		tags_hash.each do |i, tag|
  			self.tags.build(tag) unless tag == nil
  		end
  	end
  end

end
