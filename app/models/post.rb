class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags

  def tags_attributes=(tag_attributes)
    if tag_attributes.include?("0") && tag_attributes["0"][:name] != ""
      tag_attributes.each do |i, tag_attribute|
        tag = Tag.find_or_create_by(tag_attribute)
        self.tags << tag
      end
    end
  end
end
