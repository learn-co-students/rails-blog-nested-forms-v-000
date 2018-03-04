class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags, reject_if: :all_blank

  def tags_attributes=(attr)
    attr.values.each do |a|
      a = Tag.find_or_create_by(a)
      self.tags << a
    end
  end
end
