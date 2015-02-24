class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true

  #def create
   # Card.create(card_params)
 # end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
