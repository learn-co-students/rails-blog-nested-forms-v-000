class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attribute)
    if tags_attribute.first.present?
      self.tags.build(tags_attribute)
    end
  end

end
