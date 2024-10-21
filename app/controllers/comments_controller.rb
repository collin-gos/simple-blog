class CommentsController < ApplicationController
  before_action :authenticate_user!, on: [:create]

  def create
    @article = Article.find(params[:article_id])
    # Ask
    Comment.create(comment_params.merge(article_id: @article.id, user_id: current_user.id)) # Create! vs Create
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :visible)
    end
end
