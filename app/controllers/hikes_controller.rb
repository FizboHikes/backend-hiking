class HikesController < ApplicationController
  def show
    @hike = Hike.find(params[:id])
    render json: @hike
  end

  def index
    @hikes = Hike.all
    render json: @hikes
  end

  def userhikes
    @user = User.find(params[:user_id])
    @userhikes = @user.hikes
    render json: @userhikes
  end

  def create
    @hike = Hike.new(params.require(:hike).permit(:hikename, :comments, :tips, :user_id))

      if @hike.save
        render json: @hike, status: :created, location: @hike
      else
        render json: @hike.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @hike = Hike.find(params[:id])
    @hike.destroy
  end

  def update
    respond_to do |format|
      if @hike.update(params.require(:hike).permit(:hikename, :comments, :tips, :user_id))
        # format.html { redirect_to @hike, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @hike }
      else
        format.html { render :edit }
        format.json { render json: @hike.errors, status: :unprocessable_entity }
      end
    end
  end
end
