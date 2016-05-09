class PostsController < ApplicationController

 before_action :require_sign_in, except: :show

 before_action :authorize_user, except: [:show, :new, :create]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new

  end

  def create
# #9

    @topic = Topic.find(params[:topic_id])
 # #35
    @post = @topic.posts.build(post_params)
    @post.user = current_user
# #10
    if @post.save
      @post.comments = Comment.update_comments(params[:post][:comments])
      @post.labels = Label.update_labels(params[:post][:labels])
# #11
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
# #12
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  def update
       @post = Post.find(params[:id])
        @post.assign_attributes(post_params)

       if @post.save
         @post.comments = Comment.update_comments(params[:post][:comments])
         @post.labels = Label.update_labels(params[:post][:labels])
         flash[:notice] = "Post was updated."
         redirect_to [@post.topic, @post]
       else
         flash[:error] = "There was an error updating the post. Please try again."
         render :edit
       end
     end


  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
# #38
       redirect_to @post.topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
     end
   end
   private

 def post_params
   params.require(:post).permit(:title, :body)
 end
 def authorize_user
     post = Post.find(params[:id])
 # #11
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "You must be an admin or moderator to do that."
       redirect_to [post.topic, post]
     end
     unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to [post.topic, post]
    end
   end
end
