class CollaborationsController < ApplicationController
  def new
    @collaboration = Collaboration.new
  end

  def create
    @collaboration = Collaboration.new
    @collaboration.user_id = params[:collaboration][:user_id]
    @collaboration.wiki_id = 23

    if @collaboration.save
      flash[:notice] = "Collaboration was saved."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error saving the collaboration. Please try again."
      redirect_to wikis_path
    end
  end

  def destroy
    @collaboration = Collaboration.find(params[:id])

    if @collaboration.destroy
      flash[:notice] = "Collaboration was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the collaboration."
      redirect_to wikis_path
    end
  end

end
