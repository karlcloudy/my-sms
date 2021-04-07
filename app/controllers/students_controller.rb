class StudentsController < ApplicationController
  def index
    @students = Student
      .order(:last_name)
      .paginate(page: params[:page], per_page: ApplicationHelper::PAGINATION_PAGE_SIZE)
  end
end
