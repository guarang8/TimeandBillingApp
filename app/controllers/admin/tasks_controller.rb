class Admin::TasksController < ApplicationController
respond_to :html
before_filter :get_task, :except => [:index,:create]

def index
  @tasks = Task.all
  respond_with(@tasks)
end

def show
  respond_with(@task)
end

def new

end

def edit

end

def create
  @task = Task.new(params[:task])
  if @task.save
    redirect_to admin_tasks_path, :notice => "Created ..."
  else
    flash[:alert] = "Error"
    render :action => 'new'
  end
  
end

def update
  if @task.update_attributes(params[:task])
    redirect_to admin_tasks_path, :notice => "Updated ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

def destroy
  
  if @task.destroy
    redirect_to admin_tasks_path, :notice => "Destroyed ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

private
  def get_task
    @task = params[:id].present? ? Task.find(params[:id]) : Task.new
  end

end