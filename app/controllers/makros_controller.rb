class MakrosController < ApplicationController
  
  def show
    @makro = Makro.find(params[:id])
  end

end
