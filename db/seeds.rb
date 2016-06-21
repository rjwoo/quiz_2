require 'faker'


1000.times do
 request = Request.new        (name: Faker::Name.name,
                               email: Faker::Internet.email,
                               department: rand(3),
                               message: Faker::Hacker.say_something_smart)
 request.save
end
