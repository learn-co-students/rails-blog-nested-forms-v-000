class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|a| a['name'].blank?}

  validates_presence_of :name, :content

  # def tags_attributes=(tags_attributes)
  #   tags_attributes.each do |i, tag_attributes|
  #     self.tags.build(tag_attributes)
  #   end
  # end

end
