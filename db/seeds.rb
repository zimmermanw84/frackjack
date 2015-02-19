require 'faker'

#test user
User.create(:username => "test_user", :email => "test@gmail.com", :password => "pass")


# Cards

suits = ["Spade", "Hart", "Diamond", "Club"]
cards = (2..10).to_a + ['J','Q','K','A']

d = Deck.new
d.save

suits.each do |suit|
  cards.each do |card|

    if card == "K"
      d.cards.create(name: "#{card} of #{suit}", value: 10, img_url: "test")
    elsif card == "Q"
      d.cards.create(name: "#{card} of #{suit}", value: 10, img_url: "test")
    elsif card == "J"
      d.cards.create(name: "#{card} of #{suit}", value: 10, img_url: "test")
    elsif card == "A"
      d.cards.create(name: "#{card} of #{suit}", value: 11, img_url: "test")
    else
      d.cards.create(name: "#{card} of #{suit}", value: card, img_url: "test")
    end
  end
end
