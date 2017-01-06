module Indestructible
  extend ActiveSupport::Concern

  included do
    # do something
  end

  def self.included(base)
    base.class_eval do
      default_scope { where(deleted: false) }
    end
  end

  def deactive!
    self.update({ deleted: true, deleted_at: DateTime.now.to_date })
  end
end