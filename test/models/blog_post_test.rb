require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "should not save blog post without title" do
    blog_post = blog_posts(:no_title)
    assert_not blog_post.save, "Saved the blog post without a title"
  end

  test "should not save blog post without body" do
    blog_post = blog_posts(:no_body)
    assert_not blog_post.save, "Saved the blog post without a body"
  end

  test "draft? returns true for a draft blog post" do
    blog_post = blog_posts(:draft)
    assert blog_post.draft?
  end

  test "published? returns true for a published blog post" do
    blog_post = blog_posts(:published)
    assert blog_post.published?
  end

  test "scheduled? returns true for a scheduled blog post" do
    blog_post = blog_posts(:scheduled)
    assert blog_post.scheduled?
  end

  test "should not save blog post with only published_at" do
    blog_post = BlogPost.new(published_at: 1.week.from_now)
    assert_not blog_post.save
  end

  test "should save blog post with title, body, and published_at" do
    blog_post = BlogPost.new
    blog_post.title = "Test Title"
    blog_post.body = "Test Body needs to be a bit longer"
    blog_post.published_at = Time.now
    assert blog_post.save, "Saved the blog post with title, body, and published_at"
  end

  test "should not save blog post with body less than  characters" do
    blog_post = BlogPost.new
    blog_post.title = "Test Title"
    blog_post.body = "Test"
    blog_post.published_at = Time.now
    assert_not blog_post.save, "Saved the blog post with body less than 5 characters"
  end

  test "should save blog post with published_at in the future" do
    blog_post = blog_posts(:scheduled)
    assert blog_post.save, "Saved the blog post with published_at in the future"
  end

  test "should save blog post with published_at in the past" do
    blog_post = blog_posts(:published)
    assert blog_post.save, "Saved the blog post with published_at in the past"
  end
end
