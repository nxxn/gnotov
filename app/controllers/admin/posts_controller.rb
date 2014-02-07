class Admin::PostsController < ApplicationController
  layout 'administration_inner'
  before_filter :authenticate_user!

  def index
    @posts = Post.order("updated_at DESC").all
    @post = Post.new
  end

# GET /notes/1
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /notes/new
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /notes/1/edit
  def edit
    @post = Post.find(params[:id])

  end

  # POST /notes
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(admin_posts_url, :notice => 'Category was successfully created.') }
        format.js
      else
        @posts = Post.all
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /notes/1
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])

        format.html { redirect_to(admin_posts_url, :notice => 'Category was successfully updated.') }
      else
        @posts = Post.all
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /notes/1
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(admin_posts_url) }
      format.js
    end
  end

end
