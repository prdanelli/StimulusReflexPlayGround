class Todo < ApplicationRecord
  validates :description, presence: true

  scope :complete, -> { where.not(completed_at: nil) }
  scope :incomplete, -> { where(completed_at: nil) }

  def complete?
    completed_at.present?
  end
end
