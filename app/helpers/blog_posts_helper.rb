module BlogPostsHelper
  def output_time_info(blog_post)
    unless blog_post.published_at.nil?
      if blog_post.scheduled?
        content_tag(:p, "To be published on #{blog_post.published_at.to_fs(:long)}")
      else
        content_tag(:p, "#{time_ago_in_words(blog_post.published_at)} ago")
      end
    end
  end
end
