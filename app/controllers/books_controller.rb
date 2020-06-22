class BooksController < ApplicationController
before_action :authenticate_user!
before_action :login_check, only: [:edit]

def show	
	@book =Book.find(params[:id])
	@users = User.all
	@user = @book.user
	@book_comment = BookComment.new
end
	
def edit
  if  @book = current_user.books.find_by(id: params[:id])

  else
  	 redirect_to books_path
 end
end

def update
	@book =Book.find(params[:id])
	@book.user_id = current_user.id

 if @book.update(book_params)
    flash[:complete] = "You have creatad book successfully." 
	redirect_to book_path(@book.id)
else
    render "edit"	
end
end


def destroy
	 book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
end

def index
	@user = current_user
	@users =User.all
	@book = Book.new
	@books = Book.all
end

def create
	@book_comment = BookComment.new
	@book =Book.new(book_params)
    @book.user_id = current_user.id

if  @book.save
    flash[:complete] = "You have creatad book successfully." 
	redirect_to book_path(@book.id)	
else
	@books = Book.all
	@user = current_user
	render"index"
end
end


private
def book_params
    params.require(:book).permit(:title, :body)
end
def login_check
 	unless user_signed_in?
 	redirect_to user_path
  end
end
end