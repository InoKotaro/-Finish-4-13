class BooksController < ApplicationController

  def new
    @book= Book.new
  end

  def create  #表示なし
    @book= Book.new(book_params)
    if  @book.save
      redirect_to book_path(@book.id)
      flash[:notice]= "Book was successfully created."
    else
      render :index
    end
  end

  def index
    @books= Book.all
    @book= Book.new
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update  #表示なし
    book= Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy #表示なし
    book= Book.find(params[:id])
    book.destroy
    redirect_to book_path(book.id)
  end

  private #ストロングパラメータ

    def book_params
      params.require(:book).permit(:title, :body)
    end

end