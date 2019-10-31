class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  def create
    @tag= Tag.new
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
  end

end
