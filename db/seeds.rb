User.create(:name => 'Eric', :email => 'eric@mail.com', :password => 'password', :location_id => rand(1..20))

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