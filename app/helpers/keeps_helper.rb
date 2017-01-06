module KeepsHelper

  def completed_at title, date
    "#{title} at #{date.strftime('%d/%m/%Y')}"
  end

end
