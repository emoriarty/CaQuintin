class Admin::HomeController < ApplicationController
  def index
    #Falta incluir la comprobación de usuario logado
    redirect_to :login
  end

  def login
    #falta generar la platilla pidiendo el passwword
    render :layout => false
  end
end
