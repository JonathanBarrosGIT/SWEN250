class Thought < ActiveRecord::Base
  # These relationships define how ActiveRecord models connect to each other via foreign keys.
  # The defaults are used here
  belongs_to :thinker
  has_many :thumbs

  # Level #1 Input Validation(1):
  validates :thought, length: {minimum: 5, maximum: 154}
  validates :thought, uniqueness: true

end
