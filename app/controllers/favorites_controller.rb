class FavoritesController < ApplicationController

  def create
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.build(article: article)

    if favorite.save
      flash[:notice] = "Article favorited."
    else
      flash[:alert] = "Favoriting failed."
    end
    redirect_to :back
  end

  def destroy
    article = Article.find(params[:article_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "Article unfavorited."
    else
      flash[:alert] = "Unfavoriting failed."
    end
    redirect_to :back
  end
end
