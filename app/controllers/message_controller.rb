class MessageController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message sent")
    else
      flash.now.alert = "Enter all fields"
      render :new
    end
  end

end
