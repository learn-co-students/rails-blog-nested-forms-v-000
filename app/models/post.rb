class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.is_a?(Hash) ? values = tags_attributes.values : values = tags_attributes
    values.each do |tag_attrs|
      if !tag_attrs[:name].blank?
        tag = Tag.find_by(name: tag_attrs["name"])
        if tag.nil?
          self.tags.build(tag_attrs)
        else
          self.tags << tag
        end
    end
  end
end
