class Ability
  include CanCan::Ability

  def initialize student
    student ||=Student.new
      if student.has_role?.admin
        can :manage, :all
       else
        can [:index, :show]
      end
  end
end
