class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@posts = Post.find(params[:id])
  end

  def new
  	@posts = Post.new
  end

  def create
  	@post = Post.new(params.require(:post).permit(:title, :body))
  	if @post.save
  		flash[:notice] = "Post was saved."
  		redirect_to @post
  	else
  		flash[:error] = "There was an error saving the post. Please try again"
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update_attributes(params.require(:post).permit(:title, :body))
  		flash[:notice] = "Post was updated successfully"
  	else
  		flash[:error] = "Post was not saved successfully"
  	end
  end
end