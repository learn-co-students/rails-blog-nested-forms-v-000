class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates_presence_of :name, :content
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  # def tags_attributes=(tags_attributes)
  #   # tags_attributes looks like
  #   # {"0"=>{"name"=>""}, "1"=>{"name"=>""}}
  #
  #   tags_attributes.each do |i, tag_attributes|
  #     # tag_attributes looks like
  #     # {"name"=>""}
  #     if !tag_attributes.nil? && tag_attributes[:name].present?
  #       self.tags.build(tag_attributes)
  #     end
  #   end
  # end
end
