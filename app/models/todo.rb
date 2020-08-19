class Todo < ApplicationRecord
  validates :description, presence: true

  scope :complete, -> { where.not(completed_at: nil) }
  scope :incomplete, -> { where(completed_at: nil) }
  scope :positioned, -> { order(position: :asc) }
  scope :alphabetical, -> { order(description: :asc) }

  acts_as_list

  def complete?
    completed_at.present?
  end

  def incomplete?
    !complete?
  end
end
