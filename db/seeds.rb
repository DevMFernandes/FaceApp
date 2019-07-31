User.create(:name => 'Eric', :email => 'eric@mail.com', :password => 'password', :location_id => rand(1..20))

30.times do
    User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password', :location_id => rand(1..20))
    Location.create(:city => Faker::Address.city, :country => Faker::Address.country)
end

(2..10).each do |i|
    Friendship.create(:creator_id => 1,:recipient_id => i, :status => true)
end

(11..15).each do |i|
    Friendship.create(:creator_id => 1,:recipient_id => i, :status => false)
end

(16..18).each do |i|
    Friendship.create(:creator_id => i,:recipient_id => 1, :status => true)
end

(19..20).each do |i|
    Friendship.create(:creator_id => i,:recipient_id => 1, :status => false)
end