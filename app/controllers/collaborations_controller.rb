class CollaborationsController < ApplicationController
  def new
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.new
  end

  def create
    @wiki = Wiki.find(params[:collaboration][:wiki_id])
    @collaboration = Collaboration.new
    @collaboration.user_id = params[:collaboration][:user_id]
    @collaboration.wiki_id = @wiki.id

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
