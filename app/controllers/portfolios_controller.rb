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

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  
  def update
    @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title,:subtitle,:body))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy

    respond_to do |format|
      format.html {redirect_to portfolios_url, notice: "Item was removed"}
      format.json {head :no_content}
    end
  end
end
