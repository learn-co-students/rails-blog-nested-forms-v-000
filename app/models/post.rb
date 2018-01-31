class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }


  # def tags_attributes=(tag_attributes)
  #   tag_attributes.each do |name, tag_attribute|
  #     tag = Tag.find_or_create_by(name: tag_attribute)
  #     unless tag.nil?
  #       self.tags << tag
  #     end
  #   end
  # end

  # def tag_ids=(array)
  #   array.uniq.delete("").each do |i|
  #     unless self.tags.include?(i)
  #       @tag = Tag.find(i)
  #       self.tags << @tag
  #     end
  #   end
  # end

end
