class Admin::ProjectsController < ApplicationController
respond_to :html
before_filter :get_project, :except => [:index,:create]

def index
  @projects = Project.all
  respond_with(@projects)
end

def show
  respond_with(@project)
end

def new

end

def edit

end

def create
  @project = Project.new(params[:project])
  if @project.save
    redirect_to admin_projects_path, :notice => "Created ..."
  else
    flash[:alert] = "Error"
    render :action => 'new'
  end
  
end

def update
  if @project.update_attributes(params[:project])
    redirect_to admin_projects_path, :notice => "Updated ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

def destroy
  
  if @project.destroy
    redirect_to admin_projects_path, :notice => "Destroyed ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

private
  def get_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

end