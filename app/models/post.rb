class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

 #accepts_nested_attributes_for :tags, reject_if: proc {|attribute| attribute[:name].blank? }

 def tags_attributes=(tags_attributes) 		
 	tags_attributes.each do |i, tag_attribute|
 		if tag_attribute.present?
	 		tag = Tag.find_or_create_by(tag_attribute)
	 		self.post_tags.build(:tag => tag)
	 	end
 	end
 end



end
