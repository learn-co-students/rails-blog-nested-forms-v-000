class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :name, :content

  # def tags_attributes=(tag_attributes)
  #   tag_attributes.each do |i,tag_attribute| # i is here bc it was giving both the index and the value and WE DON'T KNOW WHY
  #  		if tag_attribute && tag_attribute[:name]
  #    	 	tag = Tag.find_or_create_by(tag_attribute) 
  #    	 	self.tags << tag
  #   	end
  #   end
  # end

end