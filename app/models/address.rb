class Address < ActiveRecord::Base
  def self.exec_add(params_address)
    
    address = Address.new
    address.title = params_address[:title]
    address.tel = params_address[:tel]
    address.open_hours = params_address[:pen_hours]
    address.memo = params_address[:memo]
    @err_msg = 'save ok'

    begin
      logging "model add params_address[:title] = " + params_address[:title]
      address.save
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved => ex
      @err_msg = ex.error_message
      logging @err_msg
    end
  end
end
