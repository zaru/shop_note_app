module ProductRegistrationsHelper

  def a_line
    @product_registrations = current_user.product_registrations.where("name LIKE? OR name LIKE? OR name LIKE? OR name LIKE? OR name LIKE? ","あ%","い%","う%","え%","お%" )
  end

  


end
