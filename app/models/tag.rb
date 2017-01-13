class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates_uniqueness_of :name
  
  def tags_attributes=(tags_attributes)
    tags_attributes.values.each do |tags_attribute|
      tag = Tag.find_or_create_by(tags_attribute)
      self.tag = tag
    end
  end

end
