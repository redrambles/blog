class BlogPosts::CoverImagesController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @blog_post.cover_image.purge
    redirect_to edit_blog_post_path(@blog_post), notice: "Cover image removed!"
  end
end
