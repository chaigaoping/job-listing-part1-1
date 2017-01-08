class JobsController < ApplicationController

  def index
    @job = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end


  private

  def jobs_params
    params.require(:job).permit(:title, :description)
  end
end
