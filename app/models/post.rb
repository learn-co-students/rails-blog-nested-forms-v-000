class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :name, :content

  # def tag=(tags_attributes)
  #   tags_attributes.each do |tag_attribute|
  #     if tag_attributes[:name]
  #       tag = Tag.find_or_create_by(tag_attribute)
  #       if !self.tags.include?(tag)
  #         self.post_tags.build(tag: tag)
  #       end
  #     end
  #   end
  # end

end
