class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(attributes_hash)
    attributes_hash.each do |i, tag_attributes|
      if tag_attributes.present? && tag_attributes['name'].present?
        tag = Tag.find_or_create_by(tag_attributes)
        self.post_tags.build(:tag_id => tag.id)
      end
    end
  end
end
