# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'
Card.delete_all
set = JSON.parse(open("#{Rails.root}/db/AllSets.json").read)

      #puts set[1]
      #puts set
      set["Basic"].each do |card|

        puts card

        Card.create(
        :name => card['name'].to_s,
        :cost => card['cost'],
        :cardType => card['type'],
        :rarity => card['rarity'],
        :faction => card['faction'],
        :race => card['race'],
        :playerclass => card['playerclass'],
        :text => card['text'],
        :inPlayText => card['inPlayText'],
        :mechanics => card['mechanics'],
        :flavor => card['flavor'],
        :artist => card['artist'],
        :attack => card['attack'],
        :health => card['health'],
        :durability => card['durability'],
        :blizzid => card['id'],
        :collectible => card['collectible'],
        :elite => card['elite'],
        :howToGet => card['howToG et'],
        :howToGetGold => card['howToGetGold']
        )
      end

      set["Classic"].each do |card|

        Card.create(
        :name => card['name'],
        :cost => card['cost'],
        :cardType => card['type'],
        :rarity => card['rarity'],
        :faction => card['faction'],
        :race => card['race'],
        :playerclass => card['playerclass'],
        :text => card['text'],
        :inPlayText => card['inPlayText'],
        :mechanics => card['mechanics'],
        :flavor => card['flavor'],
        :artist => card['artist'],
        :attack => card['attack'],
        :health => card['health'],
        :durability => card['durability'],
        :blizzid => card['id'],
        :collectible => card['collectible'],
        :elite => card['elite'],
        :howToGet => card['howToG et'],
        :howToGetGold => card['howToGetGold']
        )
      end
      set["Curse of Naxxramas"].each do |card|

        Card.create(
        :name => card['name'],
        :cost => card['cost'],
        :cardType => card['type'],
        :rarity => card['rarity'],
        :faction => card['faction'],
        :race => card['race'],
        :playerclass => card['playerclass'],
        :text => card['text'],
        :inPlayText => card['inPlayText'],
        :mechanics => card['mechanics'],
        :flavor => card['flavor'],
        :artist => card['artist'],
        :attack => card['attack'],
        :health => card['health'],
        :durability => card['durability'],
        :blizzid => card['id'],
        :collectible => card['collectible'],
        :elite => card['elite'],
        :howToGet => card['howToG et'],
        :howToGetGold => card['howToGetGold']
        )
      end
      set["Goblins vs Gnomes"].each do |card|

        Card.create(
        :name => card['name'],
        :cost => card['cost'],
        :cardType => card['type'],
        :rarity => card['rarity'],
        :faction => card['faction'],
        :race => card['race'],
        :playerclass => card['playerclass'],
        :text => card['text'],
        :inPlayText => card['inPlayText'],
        :mechanics => card['mechanics'],
        :flavor => card['flavor'],
        :artist => card['artist'],
        :attack => card['attack'],
        :health => card['health'],
        :durability => card['durability'],
        :blizzid => card['id'],
        :collectible => card['collectible'],
        :elite => card['elite'],
        :howToGet => card['howToG et'],
        :howToGetGold => card['howToGetGold']
        )
      end
      set["Blackrock Mountain"]  .each do |card|

        Card.create(
        :name => card['name'],
        :cost => card['cost'],
        :cardType => card['type'],
        :rarity => card['rarity'],
        :faction => card['faction'],
        :race => card['race'],
        :playerclass => card['playerclass'],
        :text => card['text'],
        :inPlayText => card['inPlayText'],
        :mechanics => card['mechanics'],
        :flavor => card['flavor'],
        :artist => card['artist'],
        :attack => card['attack'],
        :health => card['health'],
        :durability => card['durability'],
        :blizzid => card['id'],
        :collectible => card['collectible'],
        :elite => card['elite'],
        :howToGet => card['howToG et'],
        :howToGetGold => card['howToGetGold']
        )
      end
