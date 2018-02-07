class WikiPolicy < ApplicationPolicy
  def show
    if user.premium || user.admin
      if record.private!
    else
      if
    end
  end

  private
  def wiki
    record
  end
end
