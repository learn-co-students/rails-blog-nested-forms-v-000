class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  validates_presence_of :name, :content

  # accepts_nested_attributes_for :tags, reject_if: lambda {|tag_attributes| tag_attributes[:name].blank?}


# How to make a custom writer for accepting nested attributes 
#do lots of pry
  def tags_attributes=(tags_attributes)
  	tags_attributes.values.each do |name| 
    		tag= Tag.find_or_create_by(name)
  		self.tags << tag
  	end
  end 
  

  # def is_blank
  #   tags_attributes.values.blank?
  # end 
end

# add a reject if blank? 