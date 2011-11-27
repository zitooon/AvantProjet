class CategoriesController < ApplicationController

  def index
    if verif_admin
      @categories = Category.find(:all)
    else
      redirect_to :controller => 'admin'
    end
  end

  def show
    if verif_admin
      @category = Category.find(params[:id])
    else
      redirect_to :controller => 'admin'
    end
  end

  def new
    if verif_admin
      @category = Category.new
    else
      redirect_to :controller => 'admin'
    end
  end

  def edit
    if verif_admin
      @category = Category.find(params[:id])
    else
      redirect_to :controller => 'admin'
    end
  end

  def create
    if verif_admin
      @category = Category.new(params[:category])
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        redirect_to :action => "index"
      else
        render :action => "new"
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def update
    if verif_admin
      @category = Category.find(params[:id])
      if @category.update_attributes(params[:category])
        flash[:notice] = 'Category was successfully updated.'
        redirect_to :action => "index"
      else
        render :action => "edit" 
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def destroy
    if verif_admin
      @category = Category.find(params[:id])
      @category.destroy
      flash[:notice] = 'Category was successfully deleted.'
      redirect_to :action => "index"
    else
      redirect_to :controller => 'admin'
    end
  end
end
