class BoardsController < ApplicationController
  before_action :set_board, only: [:show]

  def index
    @boards = if params[:view_all]
                Board.all.order(created_at: :desc)
              else
                Board.order(created_at: :desc).limit(10)
              end
  end

  def show; end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.generate!

    if @board.save!
      redirect_to @board
      flash[:success] = "Board #{@board.name} was successfully created."
    else
      render :new
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board)
          .permit(:name, 
                  :row, 
                  :column, 
                  :mines_count, 
                  :email)
  end
end
