class ArticlesController < ActionController::Base

def create

  @category = Category.find(params[:category_id])
  @article = @category.articles.new(article_params)

  if @article.save
    @article.secret_key = SecureRandom.hex
    @article.save
    render :_key
  else
    render :new, notice: "didn't work chief"
  end
end

def new
  @category = Category.find(params[:category_id]).id.to_s
end

def show
  @article = Article.find(params[:id])
  @category = @article.category
end

def edit
  @article = Article.find(params[:id])
  @category = @article.category
end

def update
  @article = Article.where(secret_key: params[:key])
  if @article && @article.update(article_params)
    redirect_to @article, notice: "Updated!"
  else
    render :edit
  end
end

def destroy
  article = Article.find(params[:id])
  @category = article.category
  article.destroy
  redirect_to @category
end

private

  def article_params
    return params.require(:article).permit(:title, :body, :key, :category_id)
  end

  # def key_params
  #   return params.require(:article).permit(:key)
  # end

end
