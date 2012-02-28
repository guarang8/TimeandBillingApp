class Admin::InvoicesController < ApplicationController
respond_to :html
before_filter :get_invoice, :except => [:index,:create]

def index
  @invoices = Invoice.all
  respond_with(@invoices)
end

def show
  respond_with(@invoice)
end

def new
  @invoice.due_at = Date.today
  @invoice.sent_at = Date.today
end

def edit

end

def create
  @invoice = Invoice.new(params[:invoice])
  if @invoice.save
    redirect_to admin_invoices_path, :notice => "Created ..."
  else
    flash[:alert] = "Error"
    render :action => 'new'
  end
  
end

def update
  if @invoice.update_attributes(params[:invoice])
    redirect_to admin_invoices_path, :notice => "Updated ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

def destroy
  
  if @invoice.destroy
    redirect_to admin_invoices_path, :notice => "Destroyed ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

private
  def get_invoice
    @invoice = params[:id].present? ? Invoice.find(params[:id]) : Invoice.new
  end

end