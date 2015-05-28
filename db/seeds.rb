# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'json'


Card.delete_all

  def test
    set = JSON.parse(open("#{Rails.root}/db/AllSets.json").read)
    card = set['Goblins vs Gnomes'].first
    url = 'http://hearthstonehelper.com/'+ card['id'] +'/'
    doc = Nokogiri::HTML(open(url))
    item = doc.css("img")[2]
      src = item[:src]
      puts src
      cmd = ('curl ' + src + " > app/assets/images/"+ card['id']+".png")
      system(cmd)

    Card.create(
    :name => card['name'].to_s,
    :cost => card['cost'],
    :cardType => card['type'],
    :rarity => card['rarity'],
    :faction => card['faction'],
    :race => card['race'],
    :playerclass => card['playerClass'],
    :text => card['text'],
    :inPlayText => card['inPlayText'],
    :mechanics => card['mechanics'],
    :flavor => card['flavor'],
    :artist => card['artist'],
    :attack => card['attack'],
    :health => card['health'],
    :durability => card['durability'],
    :blizzid => card['id'],
    :collectible => card['collectible']
    )

  end


  def make_set(name)
    set = JSON.parse(open("#{Rails.root}/db/AllSets.json").read)
    set[name].each do |card|
      puts card
      if card['rarity'] != nil && card['collectible'] && card['type'] != 'Hero'
          url = 'http://hearthstonehelper.com/'+ card['id'] +'/'
          doc = Nokogiri::HTML(open(url))
          item = doc.css("img")[2]
          	src = item[:src]
          	puts src
          	cmd = ('curl ' + src + " > app/assets/images/"+ card['id']+".png")
          	system(cmd)

            sleep(2)
      end

      Card.create(
      :name => card['name'].to_s,
      :cost => card['cost'],
      :cardType => card['type'],
      :rarity => card['rarity'],
      :faction => card['faction'],
      :race => card['race'],
      :playerclass => card['playerClass'],
      :text => card['text'],
      :inPlayText => card['inPlayText'],
      :mechanics => card['mechanics'],
      :flavor => card['flavor'],
      :artist => card['artist'],
      :attack => card['attack'],
      :health => card['health'],
      :durability => card['durability'],
      :blizzid => card['id'],
      :collectible => card['collectible']
      )
    end
  end

  make_set("Basic")
  make_set("Classic")
  make_set("Curse of Naxxramas")
  make_set("Goblins vs Gnomes")
  make_set("Blackrock Mountain")
