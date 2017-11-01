class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  # accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }
  # won't work because we want to avoid duplicates in our tags

  validates_presence_of :name, :content

  def tags_attributes=(tag_attributes)
    if tag_attributes[:name].present?
      tag_attributes.values.each do |tag_attribute|
        tag = Tag.find_or_create_by(name: tag_attribute)
        self.post_tags.build(:tag => tag)
        # self.tags << tag # inefficient alternative
      end
    end
  end


end

class Member < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['title'].blank? }
end
