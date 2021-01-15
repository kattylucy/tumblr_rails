class PostsController < ApplicationController

    def index
    end
    
    def new
    end

    def create
        @post = Post.new(post_params)
        @post.save
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
