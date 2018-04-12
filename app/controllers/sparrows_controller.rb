class SparrowsController < ApplicationController
  def index
    @sparrows = Sparrow.all
  end
end
