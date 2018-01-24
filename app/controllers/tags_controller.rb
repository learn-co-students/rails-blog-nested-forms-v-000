class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # def create
  #   @tag = Tag.new(tag_params)
  #   if @tag.save
  #     redirect_to @tag.post
  #   else
  #     render :'posts/new'
  #   end
  # end
  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
