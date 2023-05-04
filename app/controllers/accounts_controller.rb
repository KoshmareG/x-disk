class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @new_record = current_user.records.build
  end
end
