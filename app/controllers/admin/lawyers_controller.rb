class Admin::LawyersController < ApplicationController

	before_action :authenticate_admin!

    def index
       @lawyers = Lawyer.all.with_deleted.page(params[:page]).per(10)
    end

    def show
       @lawyer = Lawyer.with_deleted.find(params[:id])
    end

    def restore
       @lawyer = Lawyer.with_deleted.find(params[:id])
       @lawyer.restore
       redirect_to admin_lawyer_path(@lawyer)
    end

    def destroy
       @lawyer = Lawyer.with_deleted.find(params[:id])
       @lawyer.destroy
       redirect_to admin_lawyer_path(@lawyer)
    end

end
