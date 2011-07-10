class BooksController < ApplicationController
  def index
    @books = Book.search_for(params[:search], :order => params[:order]).all(:include => :author)
  rescue => e
    flash[:error] = e.to_s
    @books= Book.search_for ''
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book, :notice => "Successfully created book."
    else
      render :action => 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to @book, :notice  => "Successfully updated book."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, :notice => "Successfully destroyed book."
  end

  def auto_complete_search
    begin
      @items = Book.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = [{:error =>e.to_s}]
    end
    render :json => @items
  end

end
