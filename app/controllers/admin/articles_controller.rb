class Admin::ArticlesController < ApplicationController
   before_action :authenticate_admin!
    def admin_home
        render "admin/articles/home"
    end
    def index
        @articles = ArticleDecorator.decorate_collection(Article.all)
    end
    
    def articles_published
        @articles = Article.published
        render :articles_published
    end
    
    def new
        @article = Article.new()
        render "admin/articles/new"
    end

    def create
        
        @article = Article.new(article_params)
        
        
        if @article.save
            redirect_to admin_article_path(@article), notice: "article créer avec succés"
        else
            render "admin/articles/new", status: :unprocessable_entity
        end
    end

    def show
        @article = Article.find(params[:id])
        @comment=Comment.new
        @comments = @article.comments
        render "admin/articles/show"
    end
    
    

    def edit
        @article = Article.find(params[:id])
        render "admin/articles/edit"
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            if @article.status=="published"
                @article.update(published_at:Time.now) 
            end
            redirect_to articles_index_path,notice: "Article modifié avec succès !"
        else
            render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to admin_articles_path, notice: "Article supprimer avec succés !"
        else
            redirect_to admin_articles_path, notice: "La supression de l'Article a echouer !"
        end
    end

    private
  def article_params
    params.require(:article).permit(:titre, :contenu, :status)
    #{person: {name:"moussa", age:"18", address: "niamey"}}
   # {name:"moussa", age:"18", address: "niamey"}
  end
  def authenticate_admin!
      redirect_to root_path, alert: "Accès réservé aux administrateurs." unless current_user.role_admin?
    end
end
