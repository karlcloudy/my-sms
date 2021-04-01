class Student < ActiveRecord::Base
  attr_accessible :birth_date, :email, :first_name, :gender, :last_name, :middle_name, :title

  validates :title, length: { maximum: 10 }  
  validates :last_name, :title, :birth_date, :email, :gender, presence: true
  validates :gender, inclusion: { in: ['M', 'F', 'O'] }
end
