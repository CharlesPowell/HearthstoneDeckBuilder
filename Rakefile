# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require './app/models/card'
require './app/models/deck'
require './app/models/user'
require 'open-uri'

namespace :card do

  namespace :set do
    desc "CURL all images"
    task :all_images => :environment do


        url = 'http://hearthstonehelper.com/GVG_079/'

        def make_set(name)
          set = JSON.parse(open("#{Rails.root}/db/AllSets.json").read)
          set[name].each do |card|
            url = 'http://hearthstonehelper.com/'+ card['id'] +'/'
            doc = Nokogiri::HTML(open(url))
            item = doc.css("img")[2]
              src = item[:src]
              puts src
              cmd = ('curl ' + src + " > app/assets/images/"+ card['id']+".png")
              system(cmd)

              sleep(1)
          end
        end
        make_set("Basic")
        make_set("Classic")
        make_set("Curse of Naxxramas")
        make_set("Goblins vs Gnomes")
        make_set("Blackrock Mountain")
        make_set("Reward")
        make_set("Promotion")


    end

    desc "All cards"
    task :all_cards => :environment  do

      def make_set(name)
        set = JSON.parse(open("#{Rails.root}/db/AllSets.json").read)
        set[name].each do |card|
          puts card
          if card['rarity'] != nil && card['collectible'] && card['type'] != 'Hero'

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
      end

        make_set("Basic")
        make_set("Classic")
        make_set("Curse of Naxxramas")
        make_set("Goblins vs Gnomes")
        make_set("Blackrock Mountain")
        make_set("Reward")
        make_set("Promotion")




  end

  end # namespace :card

end # namespace :db
