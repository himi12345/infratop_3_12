class BooksController < ApplicationController

  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    # 成功時のフラッシュメッセージの記述
    if book.save
      flash[:notice] = "Book was successfully created."
      # 下記の記述は redirect_to book_path(book.id) が推奨される
      redirect_to '/books/'+(book.id).to_s
    else
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    # 成功時のフラッシュメッセージのの記述
    book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
