require 'faker'

#create users
5.times do
	user = User.new(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: Faker::Lorem.characters(10)
	)
	user.save!
end

users = User.all

#create topics
15.times do
	Topic.create!(
		name: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph
	)
end
topics = Topic.all

# create posts
50.times do
	Post.create!(
			user: users.sample,
			topic: topics.sample,
			title: Faker::Lorem.sentence,
			body: Faker::Lorem.paragraph
	)
end

posts = Post.all

#create comments
100.times do
	Comment.create!(
		post: posts.sample,
		body: Faker::Lorem.paragraph
	)
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
