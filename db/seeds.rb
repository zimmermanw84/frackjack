
#test user
User.create(:username => "test_user", :email => "test@gmail.com", :password => "pass")


# Cards

cards = (2..10).to_a + ['A','J','K','Q']
suits = ["Club","Diamond" ,"Hart","Spade"]

img = %w(2C.png 2D.png 2H.png 2S.png 3C.png 3D.png 3H.png 3S.png 4C.png 4D.png 4H.png 4S.png 5C.png 5D.png 5H.png 5S.png 6C.png 6D.png 6H.png 6S.png 7C.png 7D.png 7H.png 7S.png 8C.png 8D.png 8H.png 8S.png 9C.png 9D.png 9H.png 9S.png 10C.png 10D.png 10H.png 10S.png AC.png AD.png AH.png AS.png JC.png JD.png JH.png JS.png KC.png KD.png KH.png KS.png QC.png QD.png QH.png QS.png)

d = Deck.new
d.save



for card in cards
  for suit in suits
    if card == "K"
      d.cards.create(name: "#{card} of #{suit} ", value: 10)
    elsif card == "Q"
      d.cards.create(name: "#{card} of #{suit} ", value: 10)
    elsif card == "J"
      d.cards.create(name: "#{card} of #{suit}", value: 10)
    elsif card == "A"
      d.cards.create(name: "#{card} of #{suit}", value: 11)
    else
      d.cards.create(name: "#{card} of #{suit}", value: card)

    end
  end
end

c = Card.all

c.to_a.each_with_index do |card, index|
  card.img_url = "/images/cards/#{img[index]}"
  card.save
end

