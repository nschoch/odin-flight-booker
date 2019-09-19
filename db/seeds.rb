# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airport_info = [ ['IAD', 'Eastern Time (US & Canada)'], 
                 ['SEA', 'Pacific Time (US & Canada)'],
                 ['NRT', 'Tokyo'] ]

airport_info.each do |code, t_zone|
  Airport.create(code: code, time_zone: t_zone)
end

flight_times = { 'IAD' => { 'SEA' => 20_808, 'NRT' => 50_688 },
                 'SEA' => { 'IAD' => 20_808, 'NRT' => 33_000 },
                 'NRT' => { 'IAD' => 50_688, 'SEA' => 33_000 } }

airports = Airport.all
date = Faker::Date.forward(days: 30)
airports.each do |start|
  airports.reject { |airport| airport == start }.each do |finish|
    start.departing_flights.create(finish_airport_id: finish.id,
                                   date: date,
                                   duration: flight_times[start.code][finish.code],
                                   seats_available: 300)
  end
end
