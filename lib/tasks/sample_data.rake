namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    puts "----------------"
    puts "--- populate ---"
    puts "----------------"

    make_user_types
    make_countries
    make_cities
  end
end

def make_user_types

  puts "----------------"
  puts "-- UserTypes  --"
  puts "----------------"

	UserType.create!(name: "admin")
	UserType.create!(name: "register")
	UserType.create!(name: "facebook")
  UserType.create!(name: "android")
end

def make_countries

  puts "----------------"
  puts "-- Countries  --"
  puts "----------------"

  Country.create!(name: "Colombia")
  Country.create!(name: "Brasil")
  Country.create!(name: "Argentina")
end


def make_cities

  puts "----------------"
  puts "-- Cities  --"
  puts "----------------"

  country = Country.find_by_name("Colombia")

  City.create!(name: "Manizales", slogan: "La ciudad de las puertas abiertas", country: country)
  City.create!(name: "Pereira", slogan: "Pereira", country: country)
  City.create!(name: "Medellin", slogan: "Medellin", country: country)
  City.create!(name: "Bogota", slogan: "Bogota", country: country)
end