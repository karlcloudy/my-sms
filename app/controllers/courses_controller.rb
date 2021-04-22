class CoursesController < ApplicationController
  before_filter :set_course, only: [:show, :edit, :update]

  def index
    @courses = Course
      .order('start_date DESC, end_date DESC, name')
      .paginate(page: params[:page], per_page: ApplicationHelper::PAGINATION_PAGE_SIZE)
  end

  def show
  end

  def edit
  end

  def update
    if @course.update_attributes(params[:course])
      redirect_to @course, notice: "Course information updated."
    else
      render :edit
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
