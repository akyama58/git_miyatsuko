module SectionModelConfigure
  extend ActiveSupport::Concern

  included do
    self.table_name = 'sections'

    has_many :employees, class_name: 'Employee'
  end
end
