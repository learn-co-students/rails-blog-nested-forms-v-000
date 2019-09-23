class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  # def tags_attributes=(tag_attributes)
  #   # {"0"=>{"name"=>"TESTING"}}
  #   tag_attributes.each do |i,tag_attribute|
  #     self.tags << Tag.find_or_create_by(tag_attribute) if tag_attribute[:name] != ""
  #   end
  # end
end
