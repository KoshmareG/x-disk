class AccountsController < ApplicationController
  before_action :authenticate_user!

  def show
    @new_record = current_user.records.build
    @records = current_user.records.includes(document_attachment: :blob).except(@new_record)
  end
end
