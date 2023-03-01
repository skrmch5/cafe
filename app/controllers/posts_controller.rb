class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    before_action :store_user_location!, if: :storable_location?
    # before_action :authenticate_user!
    def index

      if params[:search] == nil
        @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      elsif params[:search] == ''
        @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
      else
        @posts = Post.where("body LIKE ? ",'%' + params[:search] + '%')
      end
      # @posts = @posts.page(params[:page]).per(9)
      
    end
      
    def new
      @post = Post.new
    end
      
    def create

      post = Post.new(post_params)
      post.user_id = current_user.id

      if post.save!
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end
      
    def show
      @post = Post.find(params[:id])
      @comments = @post.comments
      @comment = Comment.new
      @reviews = @post.reviews
      @review = Review.new
    end
      
    def edit
       @post = Post.find(params[:id])
    end
      
    def update
       post = Post.find(params[:id])
      if post.update(post_params)
        redirect_to :action => "show", :id => post.id
      else
        redirect_to :action => "new"
      end
    end
      
    def destroy
       post = Post.find(params[:id])
       post.destroy
       redirect_to action: :index
    end
      
    private
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

    def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
    end
    def post_params
      params.require(:post).permit(:body, :body2, :body3, :body4, :body5, :body6,:body7, :image, :level, :tag_ids,:lat,:lng,:wifi,:outlet)
    end
    
end
