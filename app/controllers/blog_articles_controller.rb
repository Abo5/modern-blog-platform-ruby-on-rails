class BlogArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_blog_article, only: %i[ show edit update destroy ]

  # Admins: Display all articles
  def index
    @blog_articles = BlogArticle.all
  end

  # Regular Users: Display user interface
  def user_ui
    @blog_articles = BlogArticle.all
  end

  def show
    @qr_png = RQRCode::QRCode.new(blog_article_url(@blog_article)).as_png
    @qr_svg = RQRCode::QRCode.new(blog_article_url(@blog_article)).as_svg
  end

  def new
    @blog_article = BlogArticle.new
  end

  def edit
    respond_to do |format|
      format.html
      format.turbo_stream { render turbo_stream: turbo_stream.update("newArticleSidebar", partial: "form", locals: { blog_article: @blog_article }) }
    end
  end

  def create
    @blog_article = BlogArticle.new(blog_article_params)

    respond_to do |format|
      if @blog_article.save
        format.html { redirect_to blog_articles_path, notice: "Blog article was successfully created." }
        format.json { render :show, status: :created, location: @blog_article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog_article.update(blog_article_params)
        format.html { redirect_to blog_articles_path, notice: "Blog article was successfully updated." }
        format.json { render :show, status: :ok, location: @blog_article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @blog_article.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("article_#{@blog_article.id}") }
        format.html { redirect_to blog_articles_path, notice: 'Article was successfully deleted.' }
      end
    else
      redirect_to blog_articles_path, alert: 'Error deleting article.'
    end
  end

  private

  def check_if_admin
    unless current_user.admin?
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to user_ui_path
    end
  end

  def set_blog_article
    @blog_article = BlogArticle.find(params[:id])
  end

  def blog_article_params
    params.require(:blog_article).permit(:short_title, :content, :publisher, :url, :long_url_title, :short_url_title, :caption, :logo)
  end
end
