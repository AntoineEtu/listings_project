class Contact < ApplicationRecord

  belongs_to :user

  belongs_to :listing

  def self.seller_contacts_for(user_id)
    Contact.joins('LEFT JOIN listings ON listings.id = contacts.listing_id')
          .where(['listings.id = ?', user_id])
          .order('contacts.created_at DESC')
  end

  def self.buyer_messages_from(user_id)
    Contact.where(['user_id = ?',user_id]).order('contacts.created_at DESC')
  end
end
