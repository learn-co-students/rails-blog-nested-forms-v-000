class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc {|attribute| attribute['name'].blank?}

  validates_presence_of :name, :content


# works, now never do this again

#   def tags_attributes=(tag_attributes)
#     if defined?tag_attributes.values
#       tag_attributes.values.each do |attribute|
#         if attribute[:name].present?
#           tag = Tag.find_or_create_by(attribute)
#           if !self.tags.include?(tag)
#             self.tags << tag
#           end
#         end
#       end
#     end
#   end

end
