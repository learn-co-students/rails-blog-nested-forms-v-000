class User < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts, reject_if: proc { |attributes| attributes['title'].blank? }
  has_many :comments

  validates_uniqueness_of :name
  validates_presence_of :name
end
