class Account::AccountController < ApplicationController
  before_action :authenticate_user!
  layout "account"
end
