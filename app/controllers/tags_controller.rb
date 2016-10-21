class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
  end



  # To allow a user to create a new tag, the controller action for a new tag should instantiate a new tag

end
