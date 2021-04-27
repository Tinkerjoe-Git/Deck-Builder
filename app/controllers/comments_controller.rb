class CommentsController < ApplicationController
    
    def create
        @deck = Deck.find_by_id(params[:id])
        @comment = @deck.comments.build(comment_params)
        if @comment.save
            flash[:message] = "You've given your 2 cents on this pile of cards"
            redirect_to deck_path(@deck)
        else
            flash[:message] = "Unable to post comment, something went awry"
            redirect_to deck_path(@deck)
        end

    end

    private
    def comment_params
        params.require(:comment).permit(:content, :deck_id, :user_id)
    end
end
