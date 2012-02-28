class Admin::JournalEntriesController < ApplicationController
respond_to :html
before_filter :get_journal_entry, :except => [:index,:create]
before_filter :authenticate_user!

def index
  @journal_entries = JournalEntry.all
  respond_with(@journal_entries)
end

def show
  respond_with(@journal_entry)
end

def new
  @journal_entry.user_id = current_user.id
  @journal_entry.entered_at = Date.today

end

def edit

end

def create
  @journal_entry = JournalEntry.new(params[:journal_entry])
  if @journal_entry.save
    redirect_to admin_journal_entries_path, :notice => "Created ..."
  else
    flash[:alert] = "Error"
    render :action => 'new'
  end
  
end

def update
  if @journal_entry.update_attributes(params[:journal_entry])
    redirect_to admin_journal_entries_path, :notice => "Updated ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

def destroy
  
  if @journal_entry.destroy
    redirect_to admin_journal_entries_path, :notice => "Destroyed ..."
  else
    flash[:alert] = "Error"
    render :action => 'edit'
  end
end

private
  def get_journal_entry
    @journal_entry = params[:id].present? ? JournalEntry.find(params[:id]) : JournalEntry.new
  end

end