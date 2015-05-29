class CreateCardsDecks < ActiveRecord::Migration
  def change
    create_table :cards_decks do |t|
      t.references :card, index: true, foreign_key: true
      t.references :deck, index: true, foreign_key: true
    end
  end
end
