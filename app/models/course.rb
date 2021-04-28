class Course < ActiveRecord::Base
  attr_accessible :name, :description, :number_of_semesters, :start_date, :end_date, :allocation, :institute_id

  belongs_to :institute

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, :number_of_semesters, :start_date, :end_date, presence: true
  validates :number_of_semesters, numericality: { only_integer: true, greater_than: 0 }
  validates :allocation, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_nil: true }  

  delegate :name, to: :institute, prefix: true, allow_nil: true

  def selectable_institutes
    Institute.order(:name)
  end
end
