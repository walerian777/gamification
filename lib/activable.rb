module Activable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
  end

  def destroy
    destroy_associations
    run_callbacks(:destroy) { update_column(:active, false) }
  end
end
