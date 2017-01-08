class Admin::JobsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :require_is_admin

  def index
    @jobs = Job.all
  end

  def show
    @jobs = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flsh[:notice] = "Job Created"
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.upate(job_params)
      redirect_to admin_jobs_path
      flash[:notice] = "Job updated"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:altet] = "Job deleted"
    redirect_to admin_jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end
end
