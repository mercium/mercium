Factory.define :user do |f|
  f.name("#{Faker::Name.first_name} #{Faker::Name.last_name}")
  f.username{ |c| Faker::Internet.user_name(c.name) }
  f.email{ |c| Faker::Internet.email(c.name) }
  f.password("password")
  f.password_confirmation("password")
end
