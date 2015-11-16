class Thumb < ActiveRecord::Base

  # These relationships define how ActiveRecord models connect to each other via foreign keys.
  # The defaults are used here
  belongs_to :thinker
  belongs_to :thought

  validates :thought_id, uniqueness: {scope: :thinker, message: "You've thumbed this already!"}
end
