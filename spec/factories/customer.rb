Factory.define :customer do |f|
  f.first_name(Faker::Name.first_name)
  f.last_name(Faker::Name.last_name)
  f.email{ |c| Faker::Internet.email(c.name) }
  f.password("password")
  f.password_confirmation("password")
end

Factory.define :customer_with_title, :parent => :customer do |f|
  f.title(Faker::Name.prefix)
end