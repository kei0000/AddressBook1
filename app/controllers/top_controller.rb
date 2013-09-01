class TopController < ApplicationController

  
  def index
    @addresses = Address.find(:all)
  end
  
  def add
    session[:address] = nil
    @address ||= Address.new
  end
  
  def edit
    @address = Address.find params[:id]
    render :action => 'add'
  end
  
  def modify
    @address ||= session[:address]
    render :action => 'add'
  end
  
  #---------------------------------------------------
  
  def confirm_delete
    @address = Address.find params[:id]
  end
  
  def exec_delete
    Address.delete params[:id]
    redirect_to :action => 'index'
  end
  
  #--------------------------------------------------------
  
  def confirm_add
    @address = params # for confirm.html.erb
    session[:address] = params
    
  end
  
  def exec_add
    params_address = session[:address]
    @address = params_address # for _address_label.html
    if defined?(params_address)
      logging "ctrl - exec_add in - params_address[:title] = " + params_address[:title]
    else 
      logging "ctrl - exec_add in - params_address[:title] not defined"
    end
    Address.exec_add(params_address)
  end
end
