class UserKoutsuhisController < ApplicationController


  def user_koutsuhi_index 
    @user_koutsuhis = Koutsuhi.where(:user_id => 1)

    @sum_koutsuhi = Koutsuhi.get_sum_koutsuhi 
  end

end
