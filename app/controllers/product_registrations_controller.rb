class ProductRegistrationsController < ApplicationController

  def index
    @product_registration = current_user.product_registrations.new
    @product_registrations = current_user.product_registrations.all
  end

  def create
    params[:product_registration][:name].split(",").each do |product|
      current_user.product_registrations.create(name: product)
    end
    flash[:success] = "投稿しました"
    redirect_to product_registrations_path
  end

  def destroy
    ProductRegistration.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  def bluk_posting
    params[:product][:id].each do |product_id|
      product = current_user.product_registrations.find_by(id: product_id)
      note = Note.create(content: product.name,user_id: product.user_id,group_id:product.group_id)
    end
      redirect_to root_path
  end

  private

    def product_params
      params.require(:product_registration).permit(:name).split
    end
end
