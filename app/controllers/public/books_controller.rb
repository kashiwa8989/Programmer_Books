class Public::BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @users = User.all
    @book_comments = BookComment.all
    @books = params[:tag_id].present? ? Tag.find(params[:tag_id]).books : Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = User.all
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
  @books = Book.search(params[:keyword])
  @keyword = params[:keyword]
  render "index"
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :introduction, :image, tag_ids: [])
  end
end

