class AdminController < ApplicationController

  def index
    unless verif_admin
      render :action => 'login'
    end
  end

  def login 
    if (params[:admin][:name] == "admin" && params[:admin][:password] == "0132")
      session[:admin] ||= true
      redirect_to :action => 'index'
    else
      flash[:admin] = 'Bad name or password.'
      render :action => 'login'
    end
  end

  def logout
    session[:admin] = nil
    flash[:notice] = 'Vous avez &eacute;t&eacute; d&eacute;connect&eacute; avec succ&egrave;s.'
    redirect_to :controller => 'accueil'
  end

end
