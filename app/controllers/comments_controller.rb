class CommentsController < ApplicationController
	before_action :authorize_user, only: [:destroy]

	def create
		@article = Article.find(params[:article_id])
		comment = @article.comments.new(comment_params)
		comment.user = current_user

		if comment.save
			flash[:notice] = "Comment saved successfully."

			redirect_to [@article]
		else
			flash[:alert] = "Comment failed to save."
			redirect_to [@article]
		end
	end

	def destroy
		@article = Article.find(params[:article_id])
		comment = @article.comments.find(params[:id])

		if comment.destroy
			flash[:notice] = "Comment was deleted."
			redirect_to [@article.section, @article]
		else
			flash[:alert] = "Comment couldn't be deleted. Try again."
			redirect_to [@article.section, @article]
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	#def authorize_user
		#comment = Comment.find(params[:id])
		#unless current_user == comment.user || current_user.admin?
			##redirect_to [comment.post.topic, comment.post]
		#end
	end
