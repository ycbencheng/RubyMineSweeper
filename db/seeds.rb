# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


(1..11).map do |num|
  board = Board.new(name: "Board #{num}", 
                    row: num+1, 
                    column: num+1, 
                    mines_count: num,
                    email: "test@test.com")
  board.data = Array.new(num+1) { Array.new(num+1, 0) }
  board.generate! 
  board.save!
end
