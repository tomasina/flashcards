class Card < ActiveRecord::Base
  def create
    @card = Card.new(params[:card])
  end

  private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
