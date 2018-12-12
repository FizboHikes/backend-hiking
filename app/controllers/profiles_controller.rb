class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @profile = User.find(params[:id]).profile
    render json: @profile
  end


  def create
    @profile = User.find(params[:id]).profile.new(params.require(:profile).permit(:username, :about, :interests))

        if @profile.save
        render json: @profile, status: :created, location: @profile
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @profile = User.find(params[:id]).profile
    @profile.destroy
  end

  def update
    respond_to do |format|
      if @profile.update(params.require(:profile).permit(:username, :about, :interests))
        # format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
end
