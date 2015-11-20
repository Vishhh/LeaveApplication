class Ability
  include CanCan::Ability

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
 def initialize(user_or_employee)
    user_or_employee ||= User.new

    def user_rules(user)
      can :manage, User
      can :manage, Employee
    end

    def employee_rules(employee)
      can :manage, Employee
    end

    if user_or_employee.kind_of? Employee
      employee_rules(user_or_employee)
      
    elsif
      user_rules(user_or_employee)
    end
  end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:

end
