class AddressContactsController < ApplicationController
  before_action :set_address_contact, only: [:show, :edit, :update, :destroy]
  def index
      @address_contacts = AddressContact.all
  end

  def show 
  end

  def new
      @address_contact = AddressContact.new
  end

  def create
      @address_contact = AddressContact.new(address_contact_params)
      if @address_contact.save
          redirect_to address_contact_path(@address_contact)
      else
          render :new
      end
  end

  def edit
  end

  def update
      @address_contact.update(address_contact_params)
      redirect_to address_contact_path(@address_contact)
  end

  def destroy
      @address_contact.destroy
      redirect_to address_contacts_path
  end

  private

  def set_address_contact
      @address_contact = AddressContact.find(params[:id])
  end

  def address_contact_params
      params.require(:address_contact).permit(:name)
  end
end