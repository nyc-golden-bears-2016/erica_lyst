class CategoriesController < ActionController::Base

def index
  @categories = Category.all
end


def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to @category, notice: "Good Job!"
  else
    render :new, notice: "didn't work chief"
  end
end

def show
  @category = Category.find(params[:id])
  @articles = @category.articles
end

def edit
  @category = Category.find(params[:id])
end

def update
  if @category.update(category_params)
    redirect_to @category, notice: "Updated!"
  else
    render :edit
  end
end


private

  def category_params
    params.require(:category).permit(:name)
  end

end
