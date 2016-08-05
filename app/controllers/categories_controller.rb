class CategoriesController < ApplicationController
  def index
	@categories = Category.all
  end

  def edit
  end

  def show
  end

  def new
	@category = Category.new
  end
  def create
	@category = Category.new(category_params)
	   puts "category id is "+ @category_id.to_s
		if(@category.save)
			redirect_to categories_path, :notice => "Your Category has been saved"
		else
			render "new"
		end
  end
  
  private
        # Never trust parameters from the scary internet, only allow the white list through.
        def category_params
            params.require(:category).permit(:name)
        end
end
