class BuyerController < ApplicationController
  
  def signup
    if request.post?
      @buyer = Buy.create(params[:buy])
      if not @buyer.errors.empty?
        render :signup
      else
        redirect_to buyer_logon_path
      end
    else
      @buyer = Buy.new
    end
  end

  def logon
    if request.post?
      @buyer = Buy.where(["uname=? and pass=?", params[:buy][:uname], params[:buy][:pass]]).first
      if @buyer
        redirect_to buyer_catalog_path
      else
        @error = "Invalid Username and Password"
        @buyer = Buy.new
        render :logon
      end
    else
      @buyer = Buy.new
    end
  end

  def catalog
    if params[:set_locale]
      redirect_to buyer_catalog_path(:locale=>params[:set_locale])
    else

    @products = Product.all
    @cart = current_cart

    respond_to do |format|
      format.html
      format.json { render json: @products }
    end
        
  end
  end
 

end
