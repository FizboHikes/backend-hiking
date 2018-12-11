class HikesController < ApplicationController
  def show
    @hike = Hike.find(params[:id])
    render json: @hike
  end

  def index
    @hikes = Hike.all
    render json: @hikes
  end

  def user_hikes
    @user = User.find(params[:user_id])
    @userhikes = @user.hikes
    render json: @userhikes
  end


  def friend_hikes
    @friend_hikes = User.find(params[:user_id]).get_friend_hikes
    render json: @friend_hikes
  end

  def add_friend
    friend = User.find_by(email: params[:email])
    result = User.find(params[:user_id]).add_friend(friend, current_user)
    render json: {success: result}
  end

  def create
    @hike = Hike.new(params.require(:hike).permit(:hikename, :comments, :tips, :user_id, :summary, :stars, :location, :image, :difficulty, :ascent, :high, :trailhead))

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
