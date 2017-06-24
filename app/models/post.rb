class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tag_attributes)
  	tag_attributes.each do |i, attribute| 
  		if !attribute.blank?
  			tag = Tag.find_or_create_by(attribute)
			self.tags << tag 		
		end
  	end
  end
end
