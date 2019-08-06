User.create(:name => 'Thor', :email => 'foo@bar.com', :password => 'password', :location_id => rand(1..20))

5.times do |n|
    User.create(:name => Faker::Name.name, :email => "example-#{n+1}@railstutorial.org", :password => 'password', :location_id => rand(1..30))
    Location.create(:city => Faker::Address.city, :country => Faker::Address.country)
end

30.times do
    User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password', :location_id => rand(1..30))
    Location.create(:city => Faker::Address.city, :country => Faker::Address.country)
end

(1..15).each do |j|

    (1..10).each do |i|
        Friendship.create(:creator_id => j,:recipient_id => i+1, :status => true)
    end
end

(1..15).each do |j|

    (15..20).each do |i|
        Friendship.create(:creator_id => i,:recipient_id => j, :status => false)
    end
end

40.times do
  Post.create(:body => Faker::ChuckNorris.fact, :user_id => rand(1..5))
  Post.create(:body => Faker::Hacker.say_something_smart, :user_id => rand(1..5))
  Post.create(:body => Faker::Hipster.paragraphs(paragraph_count = 3, supplemental = false)[0], :user_id => rand(1..5))
end

(1..40).each do |j|

    5.times do
        Comment.create(:body => Faker::Lorem.question(word_count = 4, supplemental = false, random_words_to_add = 6), :user_id => rand(1..40), :post_id => j)
    end
end

(1..40).each do |j|
    Like.create(:likeable_type => "Post", :likeable_id => rand(1..40), :user_id => j)
end

(1..40).each do |j|
    Like.create(:likeable_type => "Comment", :likeable_id => rand(1..40), :user_id => j)
end