class Keep < ApplicationRecord
  include Indestructible

  belongs_to :makro, optional: true

  validates :title, presence: true

  scope :todo, -> { where(started: false, completed: false).order(created_at: :desc) }
  scope :current, -> { where(started: true, completed: false).order(started_at: :desc)  }
  scope :done, -> { where(completed: true).order(completed_at: :desc)  }

  before_save :start!, if: :completed?

  scope :by_ids, -> (ids) { where("id in (?)", ids)}

  def status
    return 'Completed' if self.completed?
    return self.started ? 'Started' : 'Not Initialized'
  end

  def finish_him
    self.update(completed: true, completed_at: Time.now)
  end

  def start!
    self.started = true
    self.started_at = Time.now
  end

  def ready?
    !self.started && !self.completed
  end

end
