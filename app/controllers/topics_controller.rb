class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def new
  	@topic = Topic.new
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts
  end

  def edit
  	@topic = Topic.find(params[:id])
  end

  def create
  	@topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
  	if @topic.save
  		redirect_to @topic, notice: "Topic was saved successfully."
  	else
  		flash[:error] = "Error savings Topic"
  		render :new
  	end
  end

  def update
  	@topic = Topic.find(params[:id])
  	if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
  		redirect_to @topic
  	else
  		flash[:error] = "Error saving topic. Please try again."
  		render :edit
  	end
  end
end
