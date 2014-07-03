class VisitorsController < ApplicationController
  
  def new
	# Rails.logger.debug 'Debug: entering new method'
	@visitor = Visitor.new
	@owner = Owner.new
	# flash.now[:notice] = 'Welcome'
	# flash.now[:alert] = 'My birthday is soon'
	# render 'visitors/new'
	# render 'visitors/new', :layout=>false
	# render 'visitors/new', :layout=>'special'
	# Rails.logger.debug 'Debug: Owner name is ' + @owner.name
	# raise 'Deliberate Failure'
  end
  
	def create
		@visitor = Visitor.new(secure_params)
		if @visitor.valid?
			@visitor.subscribe
			flash[:notice] = "Signed up #{@visitor.email}."
			redirect_to root_path
		else
			# if validation check fails, redisplay home page
			render :new
		end	
	end

private

	def secure_params
		params.require(:visitor).permit(:email)
	end

end