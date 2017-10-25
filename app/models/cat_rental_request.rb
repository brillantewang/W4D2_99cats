class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: true
  validates :status, :start_date, :end_date, :cat_id, presence: true

  belongs_to :cat

  def overlapping_requests
  
  end
end
