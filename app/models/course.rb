class Course < ApplicationRecord
  has_many :lectures
  has_many :users
end
