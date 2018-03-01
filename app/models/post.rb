class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags

  #Now, when we do mass assignment, our Post model will call a method called tags_attributes=. Let's add that method to our model using the accepts_nested_attributes_for macro.
  #also works with post_controller post_params add on for tags attributes
  #because we have a uniqueness validation on the name of tag, we will need to account for that; a user shouldn't have to submit a new tag every time they submit a post.

  accepts_nested_attributes_for :tags, reject_if: proc { |attributes| attributes['name'].blank? }

  validates_presence_of :name, :content

end
