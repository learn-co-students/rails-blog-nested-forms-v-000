class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, :through => :post_tags
  accepts_nested_attributes_for :tags, reject_if: :all_blank

  validates_presence_of :name, :content
end


# post"=>{"name"=>"new post", "content"=>"testing", "tag_ids"=>[""], 
# "tags"=>{"name"=>"a new tag"}}, "commit"=>"Create Post", "controller"=>"posts", "action"=>"create"}


# "post"=>{"name"=>"gtreagg", "content"=>"aggag", "tag_ids"=>[""], 
# "tags_attributes"=>{"0"=>{"name"=>"gdag"}}}, 
# "commit"=>"Create Post", "controller"=>"posts", "action"=>"create"}
