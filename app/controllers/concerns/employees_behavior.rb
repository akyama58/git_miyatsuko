module EmployeesBehavior
  extend ActiveSupport::Concern

  included do
    before_action :set_employee, only: %i(destroy show edit update)

    def index
      @employees = Employee.all
      render action: template_name
    end

    def destroy
      @employee.destroy
      if @employee.destroyed?
        flash[:notice] = 'Employee was successfully destroyed.'
        render action: 'index'
      else
      end
    end

    def new
      @employee = Employee.new
      render action: template_name
    end

    def show
      render action: template_name
    end

    def edit
      render action: template_name
    end

    def create
      @employee = Employee.new(employee_params)
      if @employee.save
        flash[:notice] = 'Employee was successfully created.'
        render action: 'show'
      else
        render action: 'new'
      end
    end

    def update
      if @employee.update(employee_params)
        flash[:notice] = 'Employee was successfully updated.'
        render action: 'show'
      else
        render action: 'edit'
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      unless preview
        @employee = Employee.find(params[:id])
      else
        @employee = Employee.find(:first)
      end
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params[:employee] ? params[:employee].permit! : {}
    end
  end
end
