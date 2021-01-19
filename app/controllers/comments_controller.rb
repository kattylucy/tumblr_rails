class CommentsController < ApplicationController

    def create
        @post = find_post
        @comment = @post.comments.create(params[:comment].permit(:name, :body))
        redirect_to post_path(@post)
    end


    private

        def find_post
            Post.find(params[:post_id])
        end
end
