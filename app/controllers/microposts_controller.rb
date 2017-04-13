class MicropostsController < ApplicationController

	before_action :logged_in_user, only: [:new, :create,:edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  	@microposts = Micropost.paginate(page: params[:page])
  end

  def new
  	@micropost = Micropost.new
  end

  def show
  	@micropost = Micropost.find(params[:id])
   
  end

  def create
	@micropost = current_user.microposts.build(micropost_params)
	if @micropost.save
	flash[:success] = "Micropost created!"
	redirect_to microposts_url
	else
		flash[:danger] = "Micropost not created fill all fields!"
	  redirect_to request.referrer || root_url
	end
end


def edit
 @micropost = Micropost.find(params[:id])
end

def update
	
end

def update
	@micropost = Micropost.find(params[:id])
	if @micropost.update_attributes(micropost_params)
	flash[:success] = "Micropost successfully updated!"
	redirect_to @micropost
	else
	render 'edit'
	end
end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :picture)
  end

  def correct_user
	@micropost = current_user.microposts.find_by(id: params[:id])
	redirect_to root_url if @micropost.nil?
  end
end
  