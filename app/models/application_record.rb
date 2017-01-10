class ApplicationRecord < ActiveRecord::Base
  include Activable

  self.abstract_class = true
end
