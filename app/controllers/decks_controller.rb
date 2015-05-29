class DecksController < ApplicationController

  def index
    authenticate!
    @user = current_user
    @decks = Deck.all
  end

  def show
    authenticate!
    @user = current_user
    @deck = Deck.find(params[:id])
    @cards = Card.all
  end

  def edit
    authenticate!
    @user = current_user
    @deck = User.find(params[:id])
    @cards = Card.all
  end
  def update
    deck = Deck.find(params[:id])
    deck.update!(deck_params)
    redirect_to "/decks/#{deck.id}"
  end

  def new
    authenticate!
    @user = current_user
    @deck = Deck.new
  end
  def create
    deck = Deck.create(deck_params)
    redirect_to "/deck/#{deck.id}"
  end

  def destroy
    Deck.destroy(params[:id])
    redirect_to "/decks"
  end


  private
  def deck_params
    params.require(:deck).permit(:name, :class_name)
  end

end
