class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.nil?
        return @scope.where(private: false)
      elsif @user.admin? #|| @user.premium?
        return @scope.all
      elsif @user.premium?
        return @scope.joins(:collaborators).where(collaborators: {user_id: @user.id }) + @scope.where(user_id: @user.id, private: true) + @scope.where(private: false)
      else @user.member?
        return @scope.joins(:collaborators).where(collaborators: {user_id: @user.id}) + @scope.where(private: false)
      end
    end
  end
end