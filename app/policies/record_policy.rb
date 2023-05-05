class RecordPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def destroy?
    create? && (record.try(:user) == user)
  end
end

