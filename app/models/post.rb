class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: :blank_name

  def blank_name(attributes)
    attributes['name'].blank?
  end

  def tags=(hash)
    tag = Tag.find_or_create_by(hash)
    self.tags << tag
  end
end
