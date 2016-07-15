class PostsController < ApplicationController
  before_action :set_params, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.save
    flash[:success] = '投稿しました！！'
    redirect_to root_path
  end

  def edit
  end

  def update
    @post.save
    flash[:success] = '更新しました！！'
    redirect_to root_path
  end

  def destroy
    @post.destroy
    flash[:success] = '削除しました！！'
    redirect_to root_path
  end

  private

    def posts_params
      params.require(:post).permit(:title, :content)
    end

    def set_params
      @post = Post.find(params[:id])
    end
end
