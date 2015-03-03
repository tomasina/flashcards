class Card < ActiveRecord::Base

  before_validation :ensure_review_date_exists

  validates :original_text, :translated_text, :review_date, presence: true

  validate :validate_original_vs_translated

  private
    def validate_original_vs_translated
      if original_text.to_s.downcase == translated_text.to_s.downcase
        errors.add(:original_text, "texts shouldn't match")
      end
    end

  protected
    def ensure_review_date_exists
      if review_date.nil?
        self.review_date = DateTime.now.to_date + 3
      end
    end
end
