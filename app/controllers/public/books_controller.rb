class Public::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_book,only: [:edit,:update,:destroy]

  def new
    @book = Book.new
  end

  def index
    @users = User.all
    @book_comments = BookComment.all

    if params[:tag_id].present?
      @books = Tag.find(params[:tag_id]).books.where(is_draft: :false).order(created_at: :desc).page(params[:page]).per(9)
    else
      @books = Book.where(is_draft: :false).order(created_at: :desc).page(params[:page]).per(9)
    end
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
  @books = Book.search(params[:keyword]).page(params[:page]).per(9)
  @keyword = params[:keyword]
  render "index"
  end

  def correct_book
        @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to root_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :introduction, :is_draft, :image, tag_ids: [])
  end

end

