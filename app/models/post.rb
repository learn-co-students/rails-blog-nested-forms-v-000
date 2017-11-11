class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  # accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes[:name].blank?}

  def tags_attributes=(tags_attributes)
  	tags_attributes.each do |tag_attributes|
  		# raise tag_attributes.inspect
  		unless tag_attributes.empty?
  			self.tags.build(tag_attributes)
  		end
  	end
  end

  def tag_ids=(ids)
  	# raise ids.inspect  
	  ids.each do |id|
	 		unless id.empty?
	  		self.tags << Tag.find(id)
	  	end
	  end
  end

end
