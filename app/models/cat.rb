class Cat < ApplicationRecord
  has_many :cat_rental_requests, dependent: :destroy

  COLORS = ["orange", "white", "black", "brown", "gold", "tan", "grey"]
  SEXES = %W(M F O)

  validates :color, inclusion: { in: COLORS, message: "That color is not a cat color. What types of cats have you been looking at?" }
  validates :sex, inclusion: { in: SEXES, message: "Sorry we didn't include that sex in our list! Please reach out to our staff so that we may be more inclusive going forward"}
  validates :sex, :color, :birth_date, :name, :description, presence: true

  def age
    (Time.now.to_date - self.birth_date.to_date) / 365
  end

  def self.colors
    COLORS
  end
end
