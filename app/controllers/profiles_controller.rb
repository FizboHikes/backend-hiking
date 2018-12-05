class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
    render json: @profile
  end


  def create
    @profile = Profile.new(params.require(:profile).permit(:username, :about, :interests))

        if @profile.save
        render json: @profile, status: :created, location: @profile
      else
        render json: @profile.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

  def new
    @profile = Profile.new
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
