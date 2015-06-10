# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby encoding: utf-8
WaterFountain.create(location: 'Aberdeen', lat: 49.234947, lon: -123.027254)
WaterFountain.create(location: 'Adanac', lat: 49.275858, lon: -123.024141)

BikeRack.create(address: "300 Abbot St", quantity: 5)
BikeRack.create(address: '400 Burrard St', quantity: 10)