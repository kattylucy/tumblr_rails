class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
    end

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to root_path
    end

    def show
        @post = find_post
    end


    private

        def post_params 
            params.require(:post).permit(:title, :body)
        end

        def find_post
            Post.find(params[:id])
        end
end
