class StudentsController < ApplicationController
  before_filter :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student
      .order(:last_name)
      .paginate(page: params[:page], per_page: ApplicationHelper::PAGINATION_PAGE_SIZE)
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(params[:student])
      redirect_to @student, notice: "Student information updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: "Student deleted."
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

end
