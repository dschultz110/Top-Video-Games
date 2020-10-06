require "csv"

# Remove all data from database
GamePlatform.delete_all
Game.delete_all
Platform.delete_all
Genre.delete_all
Publisher.delete_all

file = File.join(Rails.root, "db", "vgsales.csv")
puts "Loading Video Game data from #{file}"
data = File.read(file)
games = CSV.parse(data, headers: true)

puts "Loaded #{games.size} rows from the CSV file."

games.each do |game|
  genre = Genre.find_or_create_by(name: game["Genre"])
  publisher = Publisher.find_or_create_by(name: game["Publisher"])
  platform = Platform.find_or_create_by(name: game["Platform"])

  if genre&.valid? && genre&.valid?
    game_object = Game.create(
      name:      game["Name"],
      year:      game["Year"],
      genre:     genre,
      publisher: publisher,
      sales:     game["Global_Sales"]
    )
  end
  puts "Game: #{game_object.inspect}"
  puts "Could not create game: #{game['Name']}" unless game_object.valid?

  if platform&.valid? && game_object&.valid?
    GamePlatform.create(game: game_object, platform: platform)
  else
    puts "Invalid platform #{platform} for game: #{game['Name']}"
  end
end

puts "Created #{Game.count} Games"
puts "Created #{Genre.count} Genres"
puts "Created #{Publisher.count} Publishers"
puts "Created #{Platform.count} Platforms"
puts "Created #{GamePlatform.count} Game Platforms"
