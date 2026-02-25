class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(name: params[:name])
  end

  def create
    @post = Post.new(post_parameters)
    @post.user = current_user
    if @post.save
      redirect_to post_path(id: @post.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def post_parameters
    params.require(:post).permit(:title, :content, :topic_id)
  end


end
