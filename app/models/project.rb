class Project < ActiveRecord::Base
  has_many   :tasks
  belongs_to :user
  
  validates :name, :due_date, presence: true

  def past_due_date?
    due_date < DateTime.now
  end
end