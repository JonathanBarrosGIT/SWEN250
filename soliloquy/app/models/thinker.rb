class Thinker < ActiveRecord::Base

  # These relationships define how ActiveRecord models connect to each other via foreign keys.
  # e.g.
  #   aristotle = Thinker.find_by(name: 'Aristotle')
  #   aristotle.thumbs
  has_many :follows, :foreign_key => "follower_id", :class_name => "Follow"
  has_many :followed, :foreign_key => "followee_id", :class_name => "Follow"
  has_many :thoughts
  has_many :thumbs

  validates :url, length: {maximum: 100}, format: URI::regexp(%w(http https)), uniqueness: true
  validates :image_url, length: {maximum: 255}, format: URI::regexp(%w(http https))

  # Level #1 Input Validation(2):
  validates :name, uniqueness: true, length: {minimum: 1, maximum: 35}
  validates :name, format: { with: /\A[a-zA-Z][-'\s0-9a-zA-Z]+\z/}

end
