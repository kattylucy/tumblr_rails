class PostsController < ApplicationController

    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
        redirect_to root_path
        else
            render 'new'
        end
    end

    def show
        @post = find_post
    end

    def edit
        @post = find_post
    end

    def update
        @post = find_post
        if @post.update(post_params)
            redirect_to post_path
        end
    end

    def destroy
        @post = find_post
        @post.destroy
        redirect_to root_path
    end

    private

        def post_params 
            params.require(:post).permit(:title, :body)
        end

        def find_post
            Post.find(params[:id])
        end
end
