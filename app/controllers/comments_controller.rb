class CommentsController < ApplicationController

    def create
        @post = find_post
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end

    def destroy
        @post = find_post
        @comment = find_comment
        @comment.destroy
        redirect_to post_path(@post)
    end


    private

        def find_post
            Post.find(params[:post_id])
        end

        def find_comment 
            @post.comments.find(params[:id])
        end
end
