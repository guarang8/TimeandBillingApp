class Admin::ClientsController < ApplicationController
  
  respond_to :html
  before_filter :get_client, :except => [:index, :create]
  
  def index
    @clients = Client.all
    respond_with(@clients)
  end
  
  def show
    respond_with(@client)
  end
  
  def new
    
  end
  
  def edit
    
  end
  
  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "Created"
    else
      flash[:alert] = "Error"
    end
    redirect_to admin_clients_path
  end
  
  def update
    if @client.update_attributes(params[:client])
      flash[:notice] = "Updated"
    else
      flash[:alert] = "Error"
    end
    redirect_to admin_clients_path
  end
  
  def destroy
    if @client.destroy
      flash[:notice] = "Destroyed"
    else
      flash[:alert] = "Error"
    end
    respond_with([:admin, @client])
  end
  
  private
  
  def get_client
    @client = params[:id].present? ? Client.find(params[:id]) : Client.new
  end
end