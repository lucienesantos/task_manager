class Makro < ApplicationRecord
  include Indestructible

  has_many :keeps
  
  validates :name, presence: true

  scope :actived, -> { where(:actived, true) }

  def progress
    if self.keeps.done.any? 
      (self.keeps.done.size / self.keeps.size) * 100
    else
      return 0
    end
  end
end
