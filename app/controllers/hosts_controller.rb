class HostsController < ApplicationController
  #get list of hosts filtered by the search term
  def index
    @hosts = Host.search_for(params[:search], :order => params[:order])
    flash.clear
  rescue ScopedSearch::QueryNotSupported => e
    flash[:error] = e.to_s
    @hosts = Host.all
  end
  
  #get the syntax auto-complete suggestions
   def auto_complete_search
    begin
      @items = Host.complete_for(params[:search])
    rescue ScopedSearch::QueryNotSupported => e
      @items = e.to_s
    end
    render :json => @items
#    @highlight = ['packages']
#    render :inline => "<%= auto_complete_result @items, @highlight  %>"
  end

  def show
    @host = Host.find(params[:id])
  end

  def new
    @host = Host.new
  end

  def create
    @host = Host.new(params[:host])
    if @host.save
      flash[:notice] = "Successfully created host."
      redirect_to @host
    else
      render :action => 'new'
    end
  end

  def edit
    @host = Host.find(params[:id])
  end

  def update
    @host = Host.find(params[:id])
    if @host.update_attributes(params[:host])
      flash[:notice] = "Successfully updated host."
      redirect_to host_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @host = Host.find(params[:id])
    @host.destroy
    flash[:notice] = "Successfully destroyed host."
    redirect_to hosts_url
  end

end
