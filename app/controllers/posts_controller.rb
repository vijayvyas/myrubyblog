class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def new
		@post = Post.new
		@category= Category.all
	end
	
	def create
       @post = Post.new(post_params)
	   puts "category id is "+ @post.category_id.to_s
		if(@post.save)
			redirect_to posts_path, :notice => "Your Post has been saved"
		else
			render "new"
		end
    end
	
	
    
	
	def edit
		@post = Post.find(params[:id])

	end
	
	def update
		@post = Post.find(params[:id])
		puts "category id is "+ @post.category_id.to_s
		if(@post.update_attributes(post_params))
			redirect_to post_path, :notice => "Your Post has been updated"
		else
			render "edit"
		end
	end
	
	
	
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your Post has been deleted"
	end
	
	private
        # Never trust parameters from the scary internet, only allow the white list through.
        def post_params
            params.require(:post).permit(:post_id, :title, :body, :category_id)
        end

end
