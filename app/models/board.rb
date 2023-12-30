class Board < ApplicationRecord
  serialize :data, type: Array, coder: YAML
  validates :name, presence: true, uniqueness: true
  validates :column, :row, numericality: { only_integer: true, greater_than: 1 }
  validates :mines_count, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def generate!
    initialize_board
    set_mines
  end

  private

  def initialize_board
    self.data = Array.new(row) { Array.new(column, 0) }
  end

  def set_mines
    mines_placed = 0

    while mines_placed < mines_count
      r_row = rand(row)
      r_column = rand(column)

      if data[r_row][r_column] == 0
        data[r_row][r_column] = 1
        mines_placed += 1
      end
    end
  end
end
