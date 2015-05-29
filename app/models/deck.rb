class Deck < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :cards

  #validates :cards, length: { is: 30 }
end
