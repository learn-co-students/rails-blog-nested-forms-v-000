class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  accepts_nested_attributes_for :tags

  validates_presence_of :name, :content

  def tags_attributes=(tag_attributes)
    tag_attributes.each do |i, tag_attribute|
      if tag_attribute.present?
        tag = Tag.find_or_create_by(tag_attribute)
        self.tags << tag
      end
    end
  end
end
