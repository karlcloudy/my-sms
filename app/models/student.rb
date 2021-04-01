class Student < ActiveRecord::Base
  attr_accessible :birth_date, :email, :first_name, :gender, :last_name, :middle_name, :title

  def full_name
    #NOTE: first_name is optional to support single names.
    if middle_name
      "#{title} #{first_name} #{middle_name} #{last_name}".strip
    else
      "#{title} #{first_name} #{last_name}".strip
    end
  end

  validates :title, length: { maximum: 10 }  
  validates :last_name, :title, :birth_date, :email, :gender, presence: true
  validates :gender, inclusion: { in: ['M', 'F', 'O'] }
end
