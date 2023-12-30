require "test_helper"

class BoardTest < ActiveSupport::TestCase
  test "board data should serialize and deserialize as an array" do
    board = Board.new(row: 5, column: 5)
    board.data = Array.new(5) { Array.new(5, 0) }
    board.save

    assert_equal 5, board.data.length
    assert_equal 5, board.data.first.length
    assert_equal 0, board.data[0][0]
  end

  test "set_mines should correctly place mines" do
    board = Board.new(row: 5, column: 5, mines_count: 3)
    board.data = Array.new(5) { Array.new(5, 0) }
    board.generate! 

    mines_count = board.data.flatten.count(1)
    assert_equal 3, mines_count, "Expected 3 mines, found #{mines_count}"
  end
end
