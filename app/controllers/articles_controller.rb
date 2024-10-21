class ArticlesController < ApplicationController
  before_action :find_article, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, only: [ :new, :create, :my, :update ]

  def index
    @articles = Article.where(["visible = ?", "public"])
  end

  def my
    @articles = Article.where(["user_id = ?", current_user.id])
    render :index
  end

  def show
    # @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article.id, visible: 'public')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params.merge(user_id: current_user.id))

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])

    if @article.update(article_params.merge(user_id: current_user.id))
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :visible)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
