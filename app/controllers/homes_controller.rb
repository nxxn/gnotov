class HomesController < ApplicationController

  def index
    ap params
  end

  def works
    @works = Work.where(:show => true).order("updated_at DESC")
  end

  def about
  end

  def contacts
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :new
    end
  end

  def pricelist
    @works = Work.where(:show => true).order("updated_at DESC")
    #@item_categories = Category.enabled
  end
end


