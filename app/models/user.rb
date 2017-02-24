class User < ActiveRecord::Base
  has_many :questions
  has_many  :answers

  # Remember to create a migration!
end
