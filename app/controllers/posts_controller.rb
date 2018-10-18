class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  # def update
  #   # byebug
  #   @post = Post.find(params[:id])
  #   new_comment = @post.comments.build(
  #       content: params[:comment_content], 
  #       user_id: params[:user_id]
  #     )
  #   @post.save
  #   byebug
  #   redirect_to post_path(@post)
  # end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end

  # def comment_params
  #   params.require(:post).permit(:id, :content, :user_id)
  # end
end
