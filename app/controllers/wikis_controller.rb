class WikisController < ApplicationController
  before_action :authorize_user, except: [:index, :show, :new, :create, :edit, :update]

  def index
  	@wikis = policy_scope(Wiki)
  end

  def show
  	@wiki = Wiki.find(params[:id])
    unless (@wiki.private == false || @wiki.private == nil) || current_user.premium? || current_user.admin?
      flash[:alert] = "You must be a premium user to view private topics."
      if current_user
        redirect_to new_charge_path
      else
        redirect_to new_user_registration_path
      end
    end
  end

  def new
  	@wiki = Wiki.new
  end

  def create
  	@wiki = Wiki.new
  	@wiki.title = params[:wiki][:title]
  	@wiki.body = params[:wiki][:body]
  	@wiki.private = params[:wiki][:private]
    @wiki.user = current_user

  	if @wiki.save
  		flash[:notice] = "Wiki was saved."
  		redirect_to @wiki
  	else
  		flash.now[:alert] = "There was an error saving the wiki.  Please try again."
  		render :new
  	end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki.  Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def authorize_user
    if current_user
      @wiki = Wiki.find(params[:id])
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to @wiki
      end
    end
  end

  # def authorize_user
  #   @wiki = Wiki.find(params[:id])

  #   unless current_user == wiki.user || current_user.admin?
  #     flash[:alert] = "You must be an admin to do that."
  #     redirect_to wikis_path
  #   end
  # end
end
