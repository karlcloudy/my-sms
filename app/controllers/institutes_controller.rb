class InstitutesController < ApplicationController
  before_filter :set_institute, only: [:show, :edit, :update]

  def index
    @institutes = Institute
    .order(:name)
    .paginate(page: params[:page], per_page: ApplicationHelper::PAGINATION_PAGE_SIZE)
  end

  def show
  end

  def edit
  end

  def update
    if @institute.update_attributes(params[:institute])
      redirect_to @institute, notice: "Institute information updated."
    else
      render :edit
    end
  end

  private

  def set_institute
    @institute = Institute.find(params[:id])
  end
end
