class RecordsController < ApplicationController
  before_action :authenticate_user!

  def create
    @new_record = current_user.records.build(record_params)

    if @new_record.save
      redirect_to account_path(current_user), notice: I18n.t('controllers.records.created')
    else
      @records = current_user.records.except(@new_record)

      render 'accounts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @record = Record.find(params[:id]).destroy

    redirect_to account_path(current_user), notice: I18n.t('controllers.records.deleted')
  end

  private

  def record_params
    params.fetch(:record, {}).permit(:document)
  end
end
