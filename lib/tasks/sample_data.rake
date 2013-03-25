namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    puts "----------------"
    puts "--- populate ---"
    puts "----------------"

    make_user_types
  end
end

def make_user_types

  puts "----------------"
  puts "-- UserTypes  --"
  puts "----------------"

	UserType.create!(name: "admin")
	UserType.create!(name: "register")
	UserType.create!(name: "facebook")
end