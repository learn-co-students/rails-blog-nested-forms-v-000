class Post < ActiveRecord::Base
  belongs_to :user
  #has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.values.each do |tag_attribute|
      if tag_attribute[:name].present?
        tag = Tag.find_or_create_by(name: tag_attribute[:name])
        self.post_tags.build(tag: tag) if !self.tags.include?(tag)
      end
    end
  end
end
