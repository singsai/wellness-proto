# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

puts "Creating first competition"
Competition.create(name:'Wellness Cup 2013', start_date:"March 4, 2013")

puts "Creating first locations"
Location.create(name:'ARI Maple Shade')
Location.create(name:'ARI Mt. Laurel')
Location.create(name:'ARI Maple Shade')
Location.create(name:'BMW Mt. Laurel')

puts "Importing countries..."
CSV.foreach(Rails.root.join("countries.csv"), headers: true) do |row|
  Kountry.create! do |kountry|
    kountry.id = row[0]
    kountry.name = row[1]
    kountry.code = row[2]
  end
end