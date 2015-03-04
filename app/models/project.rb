class Project < ActiveRecord::Base

  validates :name, :due_date, presence: true

  def past_due_date?
    due_date < DateTime.now
  end
end
