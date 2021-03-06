class DecksController < ApplicationController

  def index
    authenticate!
    @user = current_user
    @deck = Deck.new
  end

  def show

    puts params
    authenticate!
    @user = current_user
    @deck = Deck.find(params[:id])
    @query = params[:query]

    @cards = Card.all.where("name ILIKE ?", "%#{ @query }%")

    class_cards = @cards.where({playerclass: @deck.class_name})
    neutral_cards = @cards.where({playerclass: nil})
    @cards = neutral_cards +  class_cards
    @cards = @cards.sort_by {|card| card.cost}


  end

  def add_card
     authenticate!
     deck = Deck.find(params[:id])
     copies = deck.cards.where({id: params[:card]})
     allcards = deck.cards
     if copies.length <2 && allcards.length < 30
       deck.cards.push(Card.find(params[:card]))
     end
     redirect_to "/decks/#{deck.id}"
  end

  def delete_card
     authenticate!
     deck = Deck.find(params[:id])
     card = Card.find(params[:card])
     thecard = IncludeCard.find_by({card_id: params[:card], deck_id: params[:id]})
     thecard.delete

     redirect_to "/decks/#{deck.id}"
  end


  def edit
    authenticate!
    @user = current_user
    @deck = Deck.find(params[:id])
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
    user = current_user
    current_user.decks.push(deck)
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
