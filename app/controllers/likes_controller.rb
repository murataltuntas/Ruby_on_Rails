class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  def index
    @likes = Like.all
  end

  # GET /likes/1
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(like_params)
    @like.userNameLiked = current_user.nick

    if @like.save
      redirect_to @post
    else
      render :new
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      redirect_to @like, notice: 'Like was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /likes/1
  def destroy
    @post = Post.find(params[:post_id])
    @like.destroy
    redirect_to @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
    end

    def getAdmin
      if current_user.nick != "admin"
        redirect_to login_url, alert: "Not authorized! Please login as admin."
      end
    end
end
