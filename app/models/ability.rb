class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin? 
      can :manage, :all
    end
    
    if user.admin_reserva?  or  user.admin? 
       alias_action  :create, :read, :update, :destroy, :to => :admin_reserva 
       can :admin_reserva, Acessorio
       can :admin_reserva, Municao
       can :admin_reserva, Armamento
       can :admin_reserva, Militar
       can :admin_reserva, Reserva
       can :admin_reserva, Reservaacessorio
       can :admin_reserva, Reservamunicao
       can :admin_reserva, Reservaarmamento
       can :admin_reserva, Cautela
       can :admin_reserva, Controle
       can :admin_reserva, Cautelaacessorio
       can :admin_reserva, Cautelamunicao
       can :admin_reserva, Cautelaarmamento
       can :admin_reserva, User
    else
        alias_action  :read, :to => :usuario
        can :usuario, Controle
        can :usuario, Cautela
    end
  end
  
  
  
  
end