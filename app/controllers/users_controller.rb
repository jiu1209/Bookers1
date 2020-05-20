class UsersController < ApplicationController
	before_action :authenticate_user!
 before_action :login_check, only: [:edit]
def index
	@book=Book.new
  @users =User.all
  @user = current_user
end

def show
	@user = User.find(params[:id])
	@book=Book.new
	@books = @user.books
end

def edit
	@user = User.find(params[:id])

if  @user = current_user

else
	  render "show"	
end
end

def update
	@user =User.find(params[:id])

if  @user.update(user_params)
	flash[:complete] = "You have updated user successfully." 
	redirect_to user_path(@user.id)

else 

     render "edit"	
end
end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image )
  end

 def login_check
       @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user)

       
      end
    end
 end