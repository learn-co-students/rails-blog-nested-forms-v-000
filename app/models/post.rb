class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  accepts_nested_attributes_for :tags

  def tag=(tag_param)
    new_tag = Tag.find_or_create_by(:name => tag_param[:name])
    self.tags << new_tag
  end

  validates_presence_of :name, :content
end
