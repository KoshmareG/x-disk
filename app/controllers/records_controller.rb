class RecordsController < ApplicationController
  before_action :authenticate_user!

  def create
    @record = current_user.records.build(record_params)

    if @record.save
      redirect_to account_path(current_user), notice: I18n.t('controllers.records.created')
    else
      render 'accounts/show', status: :unprocessable_entity
    end
  end

  private

  def record_params
    params.permit(:document)
  end
end
