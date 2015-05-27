class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@posts = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
  	@posts = Post.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
  	if @post.save
  		flash[:notice] = "Post was saved."
  		redirect_to @post
  	else
  		flash[:error] = "There was an error saving the post. Please try again"
  	end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params.require(:post).permit(:title, :body))
  		flash[:notice] = "Post was updated successfully"
  	else
  		flash[:error] = "Post was not saved successfully"
  	end
  end
end