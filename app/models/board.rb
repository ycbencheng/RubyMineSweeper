class Board < ApplicationRecord
  serialize :board_data, Array, coder: YAML
  validates :name, presence: true
  validates :column, :row, :mines_count, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def generate!
    initialize_board
    set_mines
  end

  private

  def initialize_board
    rows = Array.new(self.row) 
    columns =  Array.new(self.column, 0) 

    self.data = rows { columns }
  end

  def set_mines
    mines_placed = 0

    while mines_placed < self.mines_count
      row = rand(self.row)
      column = rand(self.column)
      cell = self.data[row][column]

      if cell == 0
        cell = 1
        mines_placed += 1
      end
    end
  end
end
