class <%= class_name.pluralize %>Controller < ApplicationController
  respond_to :html
  
  <% views.each do |v| %>
    def <%= v %>
      
    end
  <% end %>
end