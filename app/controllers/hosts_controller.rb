class HostsController < ApplicationController
  autocomplete :host, :to_s

  def index
    @hosts = Host.search_for(params[:q])
  rescue ScopedSearch::QueryNotSupported => e
    flash[:error] = e.to_s
    @hosts = Host.all
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

  def get_items(parameters)
    #get the syntax auto-complete suggestions
    begin
      Host.complete_for(parameters[:term])
    rescue ScopedSearch::QueryNotSupported => e
      return e.to_s
    end

  end

end
