class MessagesController < ApplicationController
  def show_inbox
    @messages = MessageDelivery.received_messages(current_user)
    render('inbox')
  end

  def show_outbox
    @messages = MessageDelivery.sent_messages(current_user)
    render('outbox')
  end

  def show_new_message_form
    @friends_json = current_user.friends.to_json(:only => [:id, :name])
    render('new_message_form')
  end

  def do_send_message
    Message
        .create(sender_id: current_user.id, body: params[:content])
        .deliver_to(params[:recipients])
    redirect_to(outbox_path)
  end

  def view_message
    @message = Message.find_by_id(params[:id])
    if @message.sender?(current_user)
      @error = 'You cannot view this message because you sent it.'
    elsif @message.recipient?(current_user)
      if @message.read_by?(current_user)
        @error = 'You already read this message.'
      else
        @message.read_now(current_user)
      end
    else
      @error = 'You do not have permission to view this message.'
    end
  end
end