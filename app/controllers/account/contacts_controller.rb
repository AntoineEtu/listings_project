class Account::ContactsController < Account::AccountController
  def index

    @contacts = Contact.seller_contacts_for(current_user.id)

  end
end
