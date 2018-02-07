class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank# proc {|attributes| attributes.all? {|key, value| value.blank?}} 
  validates_presence_of :name, :content

  def tags_attributes=(attributes)
  	if attributes != [{}]
	    attributes.values.each do |tag|
	  		tag_obj = Tag.find_or_create_by(tag)
	  		self.tags << tag_obj
	  	end
	end
  end
end
