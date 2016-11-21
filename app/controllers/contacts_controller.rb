class ContactsController < ApplicationController
  before_action :set_listing, only: [:show]

  # GET /contacts/1.json
  def show
  end

  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
  end

  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:message, :listing_id, :user_id).merge(:user_id => current_user.id)
    end
end
