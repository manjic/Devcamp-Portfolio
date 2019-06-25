class PortfoliosController < ApplicationController

  def index
    @portfolio_items = Portfolio.all 
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @porfolio_item = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))

    respond_to do |format|
      if @porfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Porfolio was successfully created.' }
        format.json { render :show, status: :created, location: @porfolio_item }
      else
        format.html { render :new }
        format.json { render json: @porfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
