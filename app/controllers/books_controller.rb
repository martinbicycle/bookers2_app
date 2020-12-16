class BooksController < ApplicationController
    before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
        redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
        @books = Book.all
        @user = current_user
        render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.save
    redirect_to book_path(@book.id), notice: 'Book was successfully updated.'
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
