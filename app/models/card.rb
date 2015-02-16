class Card < ActiveRecord::Base
  def create
  @card = Card.new(card_params)

  @card.save
  redirect_to @card
end

private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
