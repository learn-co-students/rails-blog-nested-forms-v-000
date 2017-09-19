class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content


  def tags_attributes=(tags_attributes)
    tags_attributes.each do |i, tag_attributes|
      unless tag_attributes.nil? || tag_attributes[:name].empty?
        tag = Tag.find_or_create_by(tag_attributes)
        self.post_tags.build(tag_id: tag.id) unless self.tags.include?(tag)
      end
    end
  end

end
