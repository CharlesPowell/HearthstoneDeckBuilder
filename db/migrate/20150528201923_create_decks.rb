class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name
      t.string :class
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
