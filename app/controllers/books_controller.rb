class BooksController < ApplicationController
  
  def index
    @books = Book.all
    
    
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Registration successfully"
      redirect_to books_path(@book.id)
    else
     @books = Book.all
     render :index
    end
    
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    
    if @book.update(book_params)
     flash[:notice] = "Update successfully"
     redirect_to book_path(@book.id)
    else
     flash.now[:notice] = "Update error"
     render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Delete successfully"
    redirect_to '/books'
  end
  
   private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
