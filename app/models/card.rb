class Card < ActiveRecord::Base
  has_many :include_card
  has_many :decks, through: :include_card
end
