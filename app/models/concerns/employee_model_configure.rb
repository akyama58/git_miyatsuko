module EmployeeModelConfigure
  extend ActiveSupport::Concern

  included do
    self.table_name = 'employees'

    belongs_to :section, class_name: 'Section', foreign_key: 'section_id'
  end
end
