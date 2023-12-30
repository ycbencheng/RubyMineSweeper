class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update]

  def index
    @boards = Board.order(created_at: :desc).limit(10)
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
      flash[:success] = "Board #{board.name} was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    @board.update(board_params)
    redirect_to @board
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
