class Card < ActiveRecord::Base

  validates :original_text, :translated_text, :review_date, presence: true

  validate :valid_original
  def valid_original
    if original_text.to_s.downcase == translated_text.to_s.downcase
      errors.add(:original_text, "texts shouldn't match")
    end
  end

  def create
    Card.create(card_params)
  end

  private
    def card_params
      params.require(:card).permit(:original_text, :translated_text, :review_date)
    end
end
