class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.string :type
      t.string :rarity
      t.string :faction
      t.string :race
      t.string :playerclass
      t.string :text
      t.string :inPlayText
      t.string :mechanics, array: true
      t.string :flavor
      t.string :artist
      t.integer :attack
      t.integer :health
      t.integer :durability
      t.string :blizzid
      t.boolean :collectible
      t.boolean :elite
      t.string :howToGet
      t.string :howToGetGold

      t.timestamps null: false
    end
  end
end