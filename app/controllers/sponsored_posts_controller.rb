class SponsoredPostsController < ApplicationController

def show
  @sponsoredpost = SponsoredPost.find(params[:id])
end

def new
  @sponsoredpost = SponsoredPost.new
  @sponsoredpost.topic = Topic.find(params[:topic_id])
end

def edit
    @sponsoredpost  = SponsoredPost.find(params[:id])
end

def create
# #9
    @sponsoredpost = SponsoredPost.new
    @sponsoredpost.title = params[:sponsored_post][:title]
    @sponsoredpost.body = params[:sponsored_post][:body]
    @sponsoredpost.price = params[:sponsored_post][:price]
    @topic = Topic.find(params[:topic_id])
 # #35
     @sponsoredpost.topic = @topic

# #10
    if @sponsoredpost.save
# #11
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
# #12
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
end
