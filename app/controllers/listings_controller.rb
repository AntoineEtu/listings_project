class ListingsController < ApplicationController

before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def index
    @listings = Listing.all
    if params[:search] or params[:category_id]
      @listings = Listing.search(params).order("created_at DESC")
    else
      @listings = Listing.all.order('created_at DESC')
    end
  end

  def show
  end

  def new
    @listing = Listing.new
    @categories = Category.all
  end

  def create
    @listing = Listing.new(task_params)
  end

  def update
      respond_to do |format|
        if @listing.update(task_params)
          format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
          format.json { render :show, status: :ok, location: @listing }
        else
          format.html { render :edit }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @listing.destroy
      respond_to do |format|
        format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

  def task_params
    params.require(:listing).permit(:title, :desc, :price, :picture, :category_id)
  end

end
