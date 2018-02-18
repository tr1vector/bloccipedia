class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin? || @user.premium?
        return @scope.all
      elsif @user.member?
        return @scope.joins(:collaborators).where(collaborators: {user_id: @user.id}) + @scope.where(private: false)
      else
        return @scope.none
      end
   end
 end
end