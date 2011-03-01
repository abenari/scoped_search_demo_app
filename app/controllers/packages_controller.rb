class PackagesController < ApplicationController
  def index
    @packages = Package.search_for(params[:search], :order => params[:order])
    flash.clear
  rescue ScopedSearch::QueryNotSupported => e
    flash[:error] = e.to_s
    @packages = Package.all
  end

  #get the syntax auto-complete suggestions
   def auto_complete_search
    begin
      @items = Package.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = e.to_s
    end
    render :json => @items
#    @highlight = ['packages']
#    render :inline => "<%= auto_complete_result @items, @highlight  %>"
  end

  def show
    @package = Package.find(params[:id])
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(params[:package])
    if @package.save
      flash[:notice] = "Successfully created package."
      redirect_to @package
    else
      render :action => 'new'
    end
  end

  def edit
    @package = Package.find(params[:id])
  end

  def update
    @package = Package.find(params[:id])
    if @package.update_attributes(params[:package])
      flash[:notice] = "Successfully updated package."
      redirect_to package_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @package.destroy
    flash[:notice] = "Successfully destroyed package."
    redirect_to packages_url
  end
end
