class JobsController < ApplicationController
 before_action :logged_in_user, only: [:new, :create,:edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  	@jobs = Job.paginate(page: params[:page])
  end

  def new
  	@job = Job.new
  end

  def show
  	@job = Job.find(params[:id])
   
  end

  def create
	@job = current_user.jobs.build(micropost_params)
	if @job.save
	flash[:success] = "Job successfully created!"
	redirect_to jobs_url
	else
		flash[:danger] = "Job not created fill all fields!"
	  redirect_to request.referrer || root_url
	end
end


def edit
 @job = Job.find(params[:id])
end

def update
	
end

def update
	@job = Job.find(params[:id])
	if @job.update_attributes(micropost_params)
	flash[:success] = "Job successfully updated!"
	redirect_to @job
	else
	render 'edit'
	end
end

	def destroy
		@job.destroy
		flash[:success] = "Job deleted"
		redirect_to request.referrer || root_url
	end

  private

  def micropost_params
    params.require(:job).permit(:title, :content)
  end

  def correct_user
	@job = current_user.jobs.find_by(id: params[:id])
	redirect_to root_url if @job.nil?
  end
end
  