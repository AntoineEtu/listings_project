class Account::MessagesController < Account::AccountController
  def index
    @messages = Contact.buyer_messages_from(current_user.id)
  end
end
