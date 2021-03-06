# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
	email: "admin@admin.com",
	password: "admin123",
	password_confirmation: "admin123",
	name: "Admin User",
	roles: "site_admin"
)

User.create!(
	email: "test@test.com",
	password: "password",
	password_confirmation: "password",
	name: "Regular User"
)




3.times do |topic|
	Topic.create!(
		title: "Topic #{topic}"
		)
	end

10.times do |blog|
	Blog.create!(
		title: "my blog post #{blog}", 
		body: "Latest course update: June 2018 - Added a comprehensive tutorial on how to work with the Rails 5.2 encrypted credentials to securely manage configuration variables such as API and application secret keys.",
		topic_id: Topic.last.id
		)
end

8.times do |portfol|
	Portfol.create!(
		title: "My Title #{portfol}",
		subtitle: "Robben",
		body: "Through the years I've constantly heard the same question from students: I can follow a tutorial, but I don't feel confident enough to build apps/features from scratch. This course is my answer to that question. I'm not satisfied in simply teaching you how to build an application, my goal is to teach you to understand how to build professional web applications, not to simply follow a tutorial. This is the most comprehensive course I've ever put together and combines my 14+ years of development experience.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200"
		)
end

1.times do |portfol|
	Portfol.create!(
		title: "My Title #{portfol}",
		subtitle: "Bayern",
		body: "Through the years I've constantly heard the same question from students: I can follow a tutorial, but I don't feel confident enough to build apps/features from scratch. This course is my answer to that question. I'm not satisfied in simply teaching you how to build an application, my goal is to teach you to understand how to build professional web applications, not to simply follow a tutorial. This is the most comprehensive course I've ever put together and combines my 14+ years of development experience.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200"
		)
end

5.times do |skills|
	Skill.create!(
		title: "Dayum #{skills}",
		percent_utilized: 87
		)
end

3.times do |technology|
	Portfol.last.technologies.create!(
		name: "Technology #{technology}"
		)
end


