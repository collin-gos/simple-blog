class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    Comment.create(comment_params.merge(@article.id))
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :visible)
    end
end
