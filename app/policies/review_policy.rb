class ReviewPolicy < ApplicationPolicy
  def new?
    user.present? && Review.user_has_reservation_for_planet?(user, record.planet)
  end

  def create?
    user.present? && Review.user_has_reservation_for_planet?(user, record.planet)
  end

  def edit?
    user.present? && record.booking.user == user
  end

  def update?
    user.present? && record.booking.user == user
  end

  def destroy?
    user.present? && record.booking.user == user
  end
end
