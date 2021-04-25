## Todo and Structure

##User
- has many decks, through: cards
- has_many :comments
- has many commented_decks, through :comment
- username
- email
- password_digest





##Card
- belongs_to Deck
- has image_url
- text
- power
- toughness
- cmc
- type
- colors
- set
- mana_cost







##Deck
-belongs_to :user
-has_many card, through :user
-has_many :comments
-has_many user, through :comments
- decklist
- sideboard
- user_id






##Comment
- belongs_to :user
- belongs_to :deck
- content





