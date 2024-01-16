class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :user_admin, only: [:index]

  def new
    @post = Post.new
    @user = current_user
    @todos = @user.todos.all
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.where(user_id: current_user.id).order(eaten_at: :asc)
    @genre_id = params[:genre_id]
    @start_date = params[:start_date]
    @end_date = params[:end_date]


    if @genre_id.present?
      @posts = @posts.where(genre_id: @genre_id).order(eaten_at: :asc)
    end

    if @start_date.present? && @end_date.present?
      start_datetime = DateTime.strptime(@start_date, '%Y-%m-%d')
      end_datetime = DateTime.strptime(@end_date, '%Y-%m-%d').end_of_day
      @posts = @posts.where(eaten_at: start_datetime..end_datetime).order(eaten_at: :asc)
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)

  end


  private
  # ストロングパラメータ

  def post_params
    params.require(:post).permit(:eaten_at, :meal_content, :image, :genre_id)
  end

end
