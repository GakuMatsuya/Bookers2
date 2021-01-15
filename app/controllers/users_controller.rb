class UsersController < ApplicationController

  def show
    @books = Book.all
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
   @user = User.find(params[:id])
   if @user == current_user
     render "edit"
   else
     redirect_to books_path
   end
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
