# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    end_user ||= EndUser.new
    
    # roleがadminのユーザーはモデルの操作を行うことができて管理者画面を閲覧可能
    if end_user.has_role?(:admin)
      can :manage, :all
      can :access_admin_page, :all
      
    # roleがend_userのemployeeのユーザーはモデルの操作も管理者画面の閲覧も出来ない
    else
      can :read, :all
      cannot :access_admin_page, :all
    end
  end
end
