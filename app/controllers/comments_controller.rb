class CommentsController < ApplicationController
before_action: only: [:create, :destroy]
	def create
     @synonym = Synonym.find(params[:synonym_id])
     @comment = @synonym.comments.create(comment_params)
     redirect_to synonym_path(@synonym)
  end
  def destroy
    @synonym = Synonym.find(params[:synonym_id])
    @comment = @synonym.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@synonym), status: 303
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :synonym_id)
    end
end
