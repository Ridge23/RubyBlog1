class IndexController < ApplicationController

  respond_to :html

  def index
    @articles = Article.where(:is_moderated => 't')
    respond_with(@articles)
  end

  def admin_articles_moderation
    @articles = Article.all
    respond_with(@articles)
  end

  def admin_users
    @users = User.where(:admin => 'f')
  end

end