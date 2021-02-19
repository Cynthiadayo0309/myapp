class ArticlesController < ApplicationController
  before_action :set_target_article, only: %i[show edit update destroy]

  def index
    @articles = Article.page(params[:page]).per(5).search(params[:search])
  end
    
  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save
      redirect_to article
    else
      redirect_to new_article_path, flash: {
        error_messages: article.errors.full_messages
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    @article.update(article_params)

    redirect_to @article
  end

  def destroy
    @article.delete

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :picture, :content)
  end

  def set_target_article
    @article = Article.find(params[:id])
  end
end

