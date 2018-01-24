class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content

  accepts_nested_attributes_for :tags , reject_if: proc { |attributes| attributes['name'].blank? }

  # def tags_attributes=(tags_attributes) 
  #   binding.pry
  #   if tags_attributes.first[1].values.present?
  #     another_tag = Tag.find_or_create_by(name: tags_attributes.first[1].values[0])
  #     if !self.tags.include?(another_tag)
  #       self.tags << another_tag
  #     end
  #   end
  # end

end
