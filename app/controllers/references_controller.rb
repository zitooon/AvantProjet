class ReferencesController < ApplicationController

  def index
    if verif_admin
      @references = Reference.find(:all, :order => "date DESC")
      @clients = Client.find(:all)
    else
      @references = Reference.find(:all, :order => "date DESC")
      @clients = Client.find(:all)
      if params[:date]
        @date = params[:date]
      else
        @ref = Reference.find(:all, :order => "date DESC", :limit => 1)
        for ref in @ref
          @date = ref.date
        end
      end
      render :action => 'references'
    end
  end

  def show
    if verif_admin
      @reference = Reference.find(params[:id])
    else
      redirect_to :controller => 'admin'
    end
  end

  def new
    if verif_admin
      @reference = Reference.new
      @clients = Client.find(:all, :order => "name ASC")
    else
      redirect_to :controller => 'admin'
    end
  end

  def edit
    if verif_admin
      @reference = Reference.find(params[:id])
      @clients = Client.find(:all, :order => "name ASC")
    else
      redirect_to :controller => 'admin'
    end
  end

  def create
    if verif_admin
      @reference = Reference.new(params[:reference])
      if params[:file] != ""
        @ext = params[:file].original_filename.split(".").last.downcase
        @reference.summary = "summaries/"+@reference.title+"_"+params[:file].original_filename
        File.open("#{RAILS_ROOT}/public/"+@reference.summary, "wb") do |f| 
          f.write(params[:file].read)
        end
      end
      if @reference.save
        flash[:notice] = 'Reference was successfully created.'
        redirect_to :action => "index"
      else
        @clients = Client.find(:all)
        render :action => "new"
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def update
    if verif_admin
      @reference = Reference.find(params[:id])
      if params[:file] != ""
        if @reference.summary
          if (File.exist?("#{RAILS_ROOT}/public/"+@reference.summary))
            File.delete("#{RAILS_ROOT}/public/"+@reference.summary)
          end
        end
        @ext = params[:file].original_filename.split(".").last.downcase
        @reference.summary = "summaries/"+@reference.title+"_"+params[:file].original_filename
        File.open("#{RAILS_ROOT}/public/"+@reference.summary, "wb") do |f| 
          f.write(params[:file].read)
        end
      end
      if @reference.update_attributes(params[:reference])
        flash[:notice] = 'Reference was successfully updated.'
        redirect_to :action => "index"
      else
        @clients = Client.find(:all, :order => "name ASC")
        render :action => "edit"
      end
    else
      redirect_to :controller => 'admin'
    end
  end

  def destroy
    if verif_admin
      @reference = Reference.find(params[:id])
      if @reference.summary
        if (File.exist?("#{RAILS_ROOT}/public/"+@reference.summary))
          File.delete("#{RAILS_ROOT}/public/"+@reference.summary)
        end
      end
      @reference.destroy
      flash[:notice] = 'Reference was successfully deleted.'
      redirect_to :action => "index"
    else
      redirect_to :controller => 'admin'
    end
  end
end
