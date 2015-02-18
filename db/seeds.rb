require 'faker'

#test user
User.create(:username => "test_user", :email => "test@gmail.com", :password => "pass")


# Cards

suits = ["Spade", "Hart", "Diamond", "Club"]
cards = (2..10).to_a + ['J','Q','K','A']

suits.each do |suit|
  cards.each do |card|
    Card.create(suit: suit, value: card, img_url: "test")
  end
end