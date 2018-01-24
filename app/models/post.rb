class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags

  def tags_attributes=(tags_attributes)
    unless tags_attributes.first.empty?
      tags_attributes.values.each do |tag_attribute|
        self.tags << Tag.find_or_create_by(tag_attribute) if !tag_attribute.values.first.empty?
      end
    end
  end
end
