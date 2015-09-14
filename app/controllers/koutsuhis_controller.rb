class KoutsuhisController < ApplicationController
    before_action :set_koutsuhi, only: [:show, :edit, :update, :destroy]
    def new 
        #@koutsuhi = current_user.created_koutsuhis.build
        @koutsuhi = Koutsuhi.new
        @koutsuhi.user_id = session[:user_credentials_id]
    end
    def edit
    end
    def update
        respond_to do |format|
            if @koutsuhi.update(koutsuhi_params)
                format.any { redirect_to action: 'index' }
               # format.html { redirect_to action: 'index' }
            else
                format.any {render :edit }
               # format.html {render :edit }
            end
        end
    end

    def destroy

        @koutsuhi.destroy
        respond_to do |format|
            format.any {redirect_to action: 'index' }
        end
    end

    def create
        #@koutsuhi = current_user.created_koutsuhis.build(koutsuhi_params)
        @koutsuhi = Koutsuhi.new(koutsuhi_params)
        if @koutsuhi.save
           # redirect_to @koutsuhi, notice: '作成しました'
           redirect_to action: 'index'
        else
            render :new
        end
    end

    def index

      @koutsuhis = Koutsuhi.where(:user_id=>session[:user_credentials_id])

      @sum_koutsuhis = Koutsuhi.get_sum_koutsuhi(session[:user_credentials_id])

      #@seisan_month_array = []
      #@seisan_month_list = {}
      #@sum_koutsuhis.each_with_index do |s, index|
      #  @seisan_month_array << s.seisan_month
      #  @seisan_month_list.store(index, s.seisan_month)
      #end

      @sum_koutsuhi = SumKoutsuhi.new
      @sum_koutsuhi.user_id = session[:user_credentials_id] 
      #@sum_koutsuhi.seisan_month_list = @seisan_month_list
      #@sum_koutsuhi.seisan_month_array = @seisan_month_array
      
      
      logger.debug("------- @seisan_month_list --------")
      logger.debug(@seisan_month_list)
      logger.debug("-----------------------------------")
      
      logger.debug("------- @sum_koutsuhi.inspect --------")
      logger.debug(@sum_koutsuhi.inspect)
      logger.debug("-----------------------------------")

    end
    def show
    end
    def user_koutsuhi_index

       @koutsuhis = Koutsuhi.where(:user_id=>1)

       @sum_koutsuhi = Koutsuhi.get_sum_koutsuhi

    end

    private
    
    def set_koutsuhi
        @koutsuhi = Koutsuhi.find(params[:id])
    end

    def koutsuhi_params

        logger.debug("-------1--------")
        logger.debug(params[:koutsuhi])
        logger.debug("---------------")
        logger.debug("-------1111--------")
       # logger.debug(params[:koutsuhi][:seisan_date].strftime("%Y/%m"))
       # logger.debug(params[:koutsuhi][:seisan_date][0..6])
        params[:koutsuhi].store("seisan_month", params[:koutsuhi][:seisan_date][0..6])

        #logger.debug("---------------")
        #logger.debug(Koutsuhi.test)
        #logger.debug("---------------")

        logger.debug("-------2--------")
        logger.debug(params[:koutsuhi])
        logger.debug("---------------")

        params.require(:koutsuhi).permit(
            :user_id, :seisan_date, :route_from, :route_to, :price, :seisan_month
        )

    end

end
