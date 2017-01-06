class Api::KeepsController < ApplicationController

  def index
    @keeps = 
      case params[:scope]
        when 'current' then Keep.current
        when 'todo' then Keep.todo
        when 'done' then Keep.done
        else Keep.current
      end
  end

end
