class ClientsController < ApplicationController

  def index
    if verif_admin
      @clients = Client.find(:all, :order => "name ASC")
      @categories = Category.find(:all)
    else
      @clients = Client.find(:all, :order => "name ASC")
      @categories = Category.find(:all)
      render :action => 'clients'
    end
  end

  def show
    if verif_admin
      @client = Client.find(params[:id])
    else
      redirect_to :controller => 'admin'
    end
  end

  def new
    if verif_admin
      @client = Client.new
      @categories = Category.find(:all)
    else
      redirect_to :controller => 'admin'
    end
  end

  def edit
    if verif_admin
      @client = Client.find(params[:id])
      @categories = Category.find(:all)
    else
      redirect_to :controller => 'admin'
    end
  end

  def create
    if verif_admin
      @client = Client.new(params[:client])
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        redirect_to :action => "index"
      else
        @categories = Category.find(:all)
        render :action => "new"
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def update
    if verif_admin
      @client = Client.find(params[:id])
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        redirect_to :action => "index"
      else
        @categories = Category.find(:all)
        render :action => "edit"
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def destroy
    if verif_admin
      @client = Client.find(params[:id])
      @client.destroy
      flash[:notice] = 'Client was successfully deleted.'
      redirect_to :action => "index"
    else
      redirect_to :controller => 'admin'
    end
  end
end
