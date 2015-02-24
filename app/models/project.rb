class Project < ActiveRecord::Base

  def past_due_date?
    due_date < DateTime.now
  end
end
