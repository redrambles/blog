# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.where(email: "a.cascarano@gmail.com").first_or_initialize
user.update!(
  password: "meemoo",
  password_confirmation: "meemoo"
)

# This will ADD to your current posts, not replace them.
# 100.times do |n|
#   blog_post = BlogPost.where(title: "Blog Post #{n + 1}").first_or_initialize
#   blog_post.update(content: "This is the body of blog post #{n + 1}", published_at: Time.current)
# end
