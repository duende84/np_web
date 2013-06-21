namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    puts "----------------"
    puts "--- populate ---"
    puts "----------------"

    make_user_types
    make_countries
    make_cities
    make_users
    make_companies
    make_products
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

  puts "--------------"
  puts "-- Cities  --"
  puts "--------------"

  country = Country.find_by_name("Colombia")

  City.create!(name: "Manizales", slogan: "La ciudad de las puertas abiertas", country: country)
  City.create!(name: "Pereira", slogan: "Pereira", country: country)
  City.create!(name: "Medellin", slogan: "Medellin", country: country)
  City.create!(name: "Bogota", slogan: "Bogota", country: country)
end

def make_users

  puts "-------------"
  puts "-- Users  --"
  puts "-------------"

  admin = UserType.find_by_name("admin")

  @user = User.create!(name: "andres",
    email: "andreselduende@gmail.com",
    nickname: "duende84",
    password:"admin123",
    password_confirmation: "admin123",
    user_type: admin)
end

def make_companies

  puts "----------------"
  puts "-- Companies  --"
  puts "----------------"

  15.times do |n|
    Company.create!(name: "Empresa_#{n+1}",
      remote_image_url: "http://20be948917086a968567-d6f97a9eba3cc258dac0d36dbb6d7ccd.r81.cf1.rackcdn.com/user2.png",
      owner: @user)
  end
end

def make_products

  puts "----------------"
  puts "-- Products  --"
  puts "----------------"

  company = Company.find(1)

  5.times do |n|
    Product.create!(name: "Producto_#{n+1}",
      price: Random.rand(100...100000),
      stock: Random.rand(100),
      branch: company)
  end
end