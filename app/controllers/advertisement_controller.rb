class AdvertisementController < ApplicationController
  def index
    @advertisement = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]

# #10
    if @advertisement.save
# #11
      flash[:notice] = "Ad was saved."
      redirect_to @advertisement
    else
# #12
      flash[:error] = "There was an error saving the Ad. Please try again."
      render :new
    end
  end
end
