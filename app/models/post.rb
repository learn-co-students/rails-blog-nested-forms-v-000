class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :name, :content

  def tag=(tag_params)
  	require 'pry'
  	binding.pry
  	new_tag=Tag.find_or_create_by(tag_params) unless tag_params[:name]=''
  	self.tags << new_tag
  end

end
