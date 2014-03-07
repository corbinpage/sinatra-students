class Student < ActiveRecord::Base
  has_many :student_blogs
  has_many :blogs, through: :student_blogs
end


