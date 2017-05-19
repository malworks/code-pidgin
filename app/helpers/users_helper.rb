module UsersHelper
  def user_articles_if_any(articles)
  if articles.any?
    render @user.articles
  else
    "#{current_user.name} has not submitted any posts yet."
  end
end

  def user_comments_if_any(comments)
    if comments.any?
      render @user.comments
    else
      "#{current_user.name} has not submitted any comments yet."
    end
  end
end
