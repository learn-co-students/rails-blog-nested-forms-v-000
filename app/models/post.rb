require 'pry'
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: lambda {|attributes| attributes['name'].blank?}

  validates_presence_of :name, :content

  #def tags_attributes=(tag_attributes)
    #binding.pry
    #if tag_attributes.present?
      #tag_attributes.values.each do |t|
        #if t[:name].present?
          #tag = Tag.find_or_create_by(t)
          #self.tags << tag
        #end
      #end
    #end
  #end



end
