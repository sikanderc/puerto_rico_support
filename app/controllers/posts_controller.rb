class PostsController < ApplicationController

  # before_action :requireSameUser, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    get_post

    @verified = (@post.user_id == current_user.id)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
    get_post
  end

  def destory
  end

  def update
    get_post
    if @post.update(post_params) && @post.user_id == current_user.id
      redirect_to post_path(@post), notice: 'Post was successfully updated.'
    elsif @post.user_id != current_user.id
      redirect_to post_path(@post), notice: 'Post can only be updated by author.'
    else
      render :edit
    end
  end



  private

  def get_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  #
  # def requireSameUser
  #   if current_user != @post.user
  #     redirect_to post_path(@post), notice: 'You can only edit or delete your own items'
  #
  #   end
  # end

end
