class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :authorized_user, only: [:edit, :update]

  # GET /books
  # GET /books.json
  def index
    @books = Book.where.not(id: Flag.select(:book_id))
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = current_user.books.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /flags
  # POST /flags.json
  def flag
    @book = Book.find(params[:id])
    @flag = @book.flags.create(params.permit(:book_id,:user_id))
    @flag.user_id = current_user.id
    
      respond_to do |format|
        if @flag.save
          format.html { redirect_to books_url, notice: 'Flag was successfully created.' }
          format.json { render json: @flag, status: :created, location: @flag }
        else
          format.html { redirect_to books_url}
          format.json { render json: @flag.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    
    def authorized_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:author, :title, :isbn, :course_id, :price)
    end
end
