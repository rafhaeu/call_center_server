class Internal < ApplicationRecord
  belongs_to :sector
  has_many :calls
end
