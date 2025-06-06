class ArticlesController < ApplicationController
    layout "user"
    def home 
       
        @articles = ArticleDecorator.decorate_collection(Article.published)
        render :articles_published
    end
    
   
    def show
        @article = Article.find(params[:id])
        @comment=Comment.new
        @comments = @article.comments
        render :show
    end
    
    

    def edit
        @article = Article.find(params[:id])
        render :edit
    end

    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            if @article.status=="published"
                @article.update(published_at:Time.now) 
            end
            redirect_to articles_path,notice: "Article modifié avec succès !"
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to articles_path, notice: "Article supprimer avec succés !"
        else
            redirect_to articles_path, notice: "La supression de l'Article a echouer !"
        end
    end

    def show_comments
        @article = Article.find(params[:id])
        @comments = @article.comments.accepted
        render :articles_published
    end
    

    private
  def article_params
    params.require(:article).permit(:titre, :contenu, :status)
    #{person: {name:"moussa", age:"18", address: "niamey"}}
   # {name:"moussa", age:"18", address: "niamey"}
  end
end
