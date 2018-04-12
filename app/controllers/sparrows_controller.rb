class SparrowsController < ApplicationController
  def index
    @sparrows = Sparrow.all
  end

  def show
    @sparrow = Sparrow.find(params[:id])
  end

  def new
    @sparrow = Sparrow.new
  end

  def create
    @sparrow = Sparrow.new(sparrow_params)
    respond_to do |format|
      if @sparrow.save
        format.html { redirect_to sparrows_path, notice: 'Post was successfully created.' }
        format.json { render action: 'index', status: :created, location: @sparrow }
      else
        format.html { render action: 'new' }
        format.json { render json: @sparrow.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def sparrow_params
    params.require(:sparrow).permit(:name, :species, :nest_ids => [], nest_attributes: [:location], :egg_ids => [], egg_attributes: [:color])
  end
end
