class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  def post_attributes=(post)
    self.post = Post.find_or_create_by(name: post.name)
    self.post.update(post)
  end
end
