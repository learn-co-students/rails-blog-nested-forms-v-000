class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc {|attributes| attributes['name'].blank?}

  validates_presence_of :name, :content

  # def tags_attributes=(tag_attributes)
  #   tag_attributes.each do |i, tag_hash|
  #     if tag_hash[:name].present?
  #       tag = Tag.find_or_create_by(name: tag_hash[:name])
  #       if !self.tags.include?(tag)
  #         self.tags << tag
  #       end
  #     end
  #   end
  # end

end
