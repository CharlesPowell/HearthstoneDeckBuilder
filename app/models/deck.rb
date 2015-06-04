class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :include_card
  has_many :cards, through: :include_card



  #validates :cards, length: { is: 30 }
end
