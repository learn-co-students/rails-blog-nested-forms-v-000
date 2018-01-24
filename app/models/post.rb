class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  def tags_attributes=(tags_attributes)
    tags_attributes.each do |k, tag_attr|
        unless tag_attr.nil?
          tag_name = tag_attr[:name]
            if !tag_name.empty?
              tag = Tag.find_or_create_by(tag_name)
              self.tags << tag
            end
        end
      end
  end
end
