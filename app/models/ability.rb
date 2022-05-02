# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    end_user ||= EndUser.new
    
    # roleがadminのユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
    if end_user.has_role?(:admin)
      can :manage, :all
    end
  
  end
end
