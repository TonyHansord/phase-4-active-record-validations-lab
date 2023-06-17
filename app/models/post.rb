class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :title_is_clickbait

  def title_is_clickbait
    clickbaity = ["Won't Believe",
                  "Secret",
                  "Top [number]",
                  "Guess"]

    if title.present? && !clickbaity.any? { |phrase| title.include?(phrase) }
      errors.add(:title, "must be clickbait")
    end
  end
end
