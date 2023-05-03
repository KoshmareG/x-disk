class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @record = current_user.records.build
  end
end
