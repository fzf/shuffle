# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |index|
  Player.create(
    name:                   "Player #{index}",
    email:                  "player#{index}@thanx.com",
    password:               'password',
    password_confirmation:  'password'
  )
end

game = Game.create(
  points: 11,
  sides: [
    Side.create(
      direction: 'east',
      players: [
        Player.all[0],
        Player.all[2]
      ]
    ),
    Side.create(
      direction: 'west',
      players: [
        Player.all[1],
        Player.all[3]
      ]
    )
  ],
  teams: [
    Team.create(
      color: 'red',
      players: [
        Player.all[0],
        Player.all[1]
      ]
    ),
    Team.create(
      color: 'blue',
      players: [
        Player.all[2],
        Player.all[3]
      ]
    )
  ]
)
