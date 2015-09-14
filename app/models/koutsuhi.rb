class Koutsuhi < ActiveRecord::Base

  def self.get_sum_koutsuhi(id)

    @sum_koutsuhi = Koutsuhi.select('user_id, seisan_month, sum(price) as sum_price')
    @sum_koutsuhi = @sum_koutsuhi.where("user_id" => id)
    @sum_koutsuhi = @sum_koutsuhi.group('user_id, seisan_month')
    @sum_koutsuhi = @sum_koutsuhi.order('user_id')

  end



end
