class SectionsController < ApplicationController

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def index
		@sections = Section.all
	end

	def show
		@section = Section.find(params[:id])

    @published_articles = @section.articles.where(published: true)
	end

  def authorize_user
     unless current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to sections_path
     end
   end
end
