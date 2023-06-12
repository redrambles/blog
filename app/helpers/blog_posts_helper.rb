module BlogPostsHelper
  def output_time_info(blog_post)
    if blog_post.scheduled?
      content_tag(:p, "To be published on #{blog_post.published_at.to_fs(:long)}")
    elsif blog_post.published?
      content_tag(:p, "#{time_ago_in_words(blog_post.published_at)} ago")
    end
  end
end
