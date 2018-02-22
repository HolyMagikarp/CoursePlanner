class User < ApplicationRecord
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :lectures
  has_and_belongs_to_many :programs
  has_many :credits

end
