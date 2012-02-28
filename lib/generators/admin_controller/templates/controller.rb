class Admin::<%=class_name.pluralize%>Controller < ApplicationController
respond_to :html
before_filter :get_<%=file_name%>, :except => [:index,:create]

def index
  @<%=plural_name%> = <%=class_name%>.all
  respond_with(@<%=plural_name%>)
end

def show
  respond_with(@<%=file_name%>)
end

def new

end

def edit

end

def create
  @<%=file_name%> = <%=class_name%>.new(params[:<%=file_name%>])
  if @<%=file_name%>.save
    redirect_to admin_<%=plural_name%>_path, :notice => "Created ..."
  else
    flash[:alert] = "Error"
    render :action => 'new'
  end
  
end

def update
  if @<%=file_name%>.update_attributes(params[:<%=file_name%>])
    redirect_to admin_<%=plural_name%>_path, :notice => "Updated ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

def destroy
  
  if @<%=file_name%>.destroy
    redirect_to admin_<%=plural_name%>_path, :notice => "Destroyed ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

private
  def get_<%=file_name%>
    @<%=file_name%> = params[:id].present? ? <%=class_name%>.find(params[:id]) : <%=class_name%>.new
  end

end