class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit,
                                        :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  # GET /users/:id
  def show
    @user = User.find(params[:id])
    # => app/views/users/show.html.erb
    # debugger
  end
  
  def index
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
    # => form_for @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save # => Validation
      # Sucess
      log_in @user
      flash[:success] = "アカウント作成に成功しました"
      redirect_to @user
      # GET "/users/#{@user.id}" => show
    else
      # Failure
      render 'new'
    end
  end

  # GET /users/:id/edit
  # params[:id] => :id
  def edit
    @user = User.find(params[:id])
    # => app/views/users/edit.html.erb
  end

  #PATCH /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Success
      flash[:success] = "設定を更新しました"
      redirect_to @user
    else
      # Failure
      # => @user.errors.full_messages()
      render 'edit'
    end
  end

  # DELETE /users/:id
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "削除します"
    redirect_to users_url
  end
  
  def search
    @users = User.search(params[:search])
  end
  
      def follow
      @user = User.find(params[:user_id])
      current_user.follow(@user)
      redirect_to user_path(@user)
    end
    #フォローする

  def unfollow
      @user = User.find(params[:user_id])
      current_user.stop_following(@user)
      redirect_to user_path(@user)
  end
  #フォローを外す


  def follow_list
    @user = User.find(params[:user_id])
  end
  #フォローしてる人の一覧ページ

  def follower_list
    @user = User.find(params[:user_id])
  end
  #フォロワーの一覧ページ

  private

    def user_params
      params.require(:user).permit(
        :name, :email, :password,
        :password_confirmation)
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインしてください."
        redirect_to login_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
      # GET   /users/:id/edit
      # PATCH /users/:id
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end