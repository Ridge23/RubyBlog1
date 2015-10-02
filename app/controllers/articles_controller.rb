class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :moderate]
  respond_to :html

  def index
    @articles = Article.where(user_id: current_user.id)
    respond_with(@articles)
  end

  def show
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    save_tags
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  def moderate
    if @article.is_moderated?
      update_param = false
    else
      update_param = true
    end
    @article.update_attribute(:is_moderated, update_param)
    redirect_to admin_articles_path
  end

  def find
    tag = params[:tag]
    @articles = Article.tagged_with(tag)
    render "index/index"
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :user_id, :tag_list)
    end

  def save_tags
    @article.tag_list = article_params[:tag_list]
    @article.save
  end

end
