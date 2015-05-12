class Admin::WorksController < ApplicationController
  layout 'administration_inner'
  before_filter :authenticate_user!

  def index
    @works = Work.order("display_order ASC").all
    @work = Work.new
  end

# GET /notes/1
  def show
    @work = Work.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /notes/new
  def new
    @work = Work.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /notes/1/edit
  def edit
    @work = Work.find(params[:id])

  end

  # POST /notes
  def create
    @work = Work.new(params[:work])

    respond_to do |format|
      if @work.save
        format.html { redirect_to(admin_works_url, :notice => 'Category was successfully created.') }
        format.js
      else
        @works = Work.all
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /notes/1
  def update
    @work = Work.find(params[:id])



    respond_to do |format|
      if @work.update_attributes(params[:work])

        format.html { redirect_to(admin_works_url, :notice => 'Category was successfully updated.') }
      else
        @works = Work.all
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /notes/1
  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    respond_to do |format|
      format.html { redirect_to(admin_works_url) }
      format.js
    end
  end

end
