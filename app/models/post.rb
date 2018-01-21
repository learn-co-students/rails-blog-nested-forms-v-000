class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc {|attribute| attribute['title'].blank?}
  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attr|
      if tag_attr && !tag_attr[:name].empty?
        my_tag = Tag.find_or_create_by(tag_attr)
        self.post_tags.build(tag: my_tag)
      end
    end
  end
end
