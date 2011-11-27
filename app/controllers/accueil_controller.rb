class AccueilController < ApplicationController

  def index
    render :action => "index", :layout => false
  end

end
