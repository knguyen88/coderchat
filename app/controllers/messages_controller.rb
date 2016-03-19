class MessagesController < ApplicationController
  def show_inbox
    render('inbox')
  end

  def show_outbox
    render('outbox')
  end

  def show_new_message_form
    @friends_json = current_user.friends.to_json(:only => [:id, :name])
    render('new_message_form')
  end

  def do_send_message

    redirect_to(outbox_path)
  end
  private
end