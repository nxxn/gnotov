class HomesController < ApplicationController

  def index
  end

  def works
    @works = Work.where(:show => true).order("display_order ASC")
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

end
