## Todo and Structure

##User
- has many decks through: cards
- has_many :comments
- has many commented_decks, through :comments
- username
- email
- password_digest





##Card
- belongs_to Deck
- has img_url
- text
- how do we want to go about this?
- power
- toughness
- cost
- cmc
- type







##Deck
-belongs_to :user
-has_many card, through :user
-has_many :comments
-has_many user, through :comments
- decklist
- sideboard






##Comment
- belongs_to :user
- belongs_to :deck
- content





