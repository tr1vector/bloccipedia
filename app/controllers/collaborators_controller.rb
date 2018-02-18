class CollaboratorsController < ApplicationController
	def create
		@wiki = Wiki.find(params[:wiki_id])
		@user = User.where(email: params[:email]).take
		if @user == nil
			flash[:error] = "That user does not exist."
			redirect_to edit_wiki_path(@wiki)
		else
			collaborator = @wiki.collaborators.build(user_id: @user.id)
			if collaborator.save
				flash[:notice] = "#{@user.email} has been added to the wiki."
				redirect_to edit_wiki_path(@wiki)
			else
				flash[:error] = "#{@user.email} could not be added.  Please try again."
				redirect_to edit_wiki_path(@wiki)
			end
		end
	end

	def destroy
		@collaborator = Collaborator.find(params[:id])
		@wiki = @collaborator.wiki
		if @collaborator.destroy
			flash[:notice] = "#{@collaborator.user.email} removed as a collaborator on this wiki"
			redirect_to edit_wiki_path(@wiki)
		else
			flash[:error] = "#{@collaborator.user.email} could not be deleted."
			redirect_to edit_wiki_path(@wiki)
		end
	end
end
