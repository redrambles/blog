class BlogPostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.create(blog_params)
    if @blog_post.save
      redirect_to @blog_post, notice: "Post created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_params)
      redirect_to @blog_post, notice: "Post updated!"
    else

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Post deleted!"
  end

  private

  def blog_params
    params.require(:blog_post).permit(:title, :body)
  end

  def set_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
