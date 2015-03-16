class Task < ActiveRecord::Base
  belongs_to :list

  validates :description, :presence => true

  def mark_done

    self.done = !self.done

    self.save
  end
end
