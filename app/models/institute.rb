class Institute < ActiveRecord::Base
  attr_accessible :name

  has_many :courses

  validates :name, presence: true

  def course_listing
    courses.order(:name)
  end
end
