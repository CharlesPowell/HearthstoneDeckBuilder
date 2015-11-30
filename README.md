# Hearthstone Deck Building App
#### [hsdeckbuilder.herokuapp.com](hs-deckbuilder.herokuapp.com)

[ERD LINK](https://docs.google.com/drawings/d/1fp8rmuYagJPE65ERni-YPnH9SrSxNSvQLwFzvpgS8pk/edit)

## Summary
This is a ruby on rails application that lets the user build decks from all the existing hearhstone cards. I populated the database with images scraped using nokogiri and imported all the json data when seeding the database. I used bootstrap to style the website and make it responsive to mobile

##App in action
![gif yo](/deck.gif)

##Challenges
The biggest challenge I had was figuring out the relations using ActiveRecord, managing all the cards in the database and how the decks would access them. First I tried using the has_and_belongs_to_many relationship, but had a problem with removing cards from a deck, so I switched to simply writing a join table that took care of those relations

##Version 2

In the future I will add backbone to make the rendering happen without refreshing the page, and add some functionality and additional images to produce a smaller decklist using the images similar to in game.
