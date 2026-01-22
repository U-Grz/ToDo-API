class Task < ApplicationRecord
	validates :title, presence: true, length: { minimum: 1, maximum: 255 }
	validates :completed, inclusion: { in: [true, false] }

	scope :completed, -> { where(completed: true) }
	scope :incomplete, -> { where(completed: false) }
	scope :due_soon, -> { where('due_date <=?', 7.days.from_now).order(:due_date) }
	scope :overdue, -> { where('due_date < ?', Date.today).where(completed: false) }
end
