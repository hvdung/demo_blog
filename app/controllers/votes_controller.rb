class VotesController < ApplicationController
    def create
        @post = Post.find_by id: params[:post_id]
        @post.liked_by current_user
        # redirect_to @post
        respond_to do |format|
            format.html { redirect_to @post, notice: "Like created!" }
            format.js {render :vote}
        end
    end

    def destroy
        @post = Post.find_by id: params[:post_id]
        @post.disliked_by current_user
        # redirect_to @post
        respond_to do |format|
            format.html { redirect_to @post, notice: "Like undo!" }
            format.js {render :vote}
        end
    end

end
