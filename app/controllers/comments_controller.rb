class CommentsController < ApplicationController
    before_action :set_article
    def create
        
        @comment = @article.comments.new(comment_params)
        if @comment.save
            redirect_to article_path(@article), notice: 'Commentaire ajouté avec succès.'
        else
            @comments = @article.comments
          render :show, status: :unprocessable_entity
        end
    end

    def edit
        @comments=@article.comments
        @comment=@article.comments.find(params[:id])
        render "articles/show"
    end

    def update
        @article = Article.find(params[:id])
        @comment=@article.comments.find(params[:id])
        
        if @comment.update(comment_params)
            redirect_to article_path(@article),notice: "commentaire modifié avec succès !"
        else
            redirect_to article_path(@article),notice: "commentaire non modifié"
        end

    end
    def destroy
        @article = Article.find(params[:id])
        @comment=@article.comments.find(params[:comment_id])
        if @comment.destroy
            redirect_to article_path(@article), notice: "commentaire  supprimer avec succés !"
        else
             redirect_to article_path(@article), notice: "la suppression du commentaire a echoué !"
        end
    end
    def comment_params
        params.require(:comment).permit(:author, :content, :status,:id)
        #{person: {name:"moussa", age:"18", address: "niamey"}}
       # {name:"moussa", age:"18", address: "niamey"}
      end

      def set_article
        @article = Article.find(params[:article_id])
      end
end
