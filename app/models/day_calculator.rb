class DayCalculator
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :chaptres, :chaptre_length, :time_per_day, :available_days

    validates :chaptres, presence: true
    validates :chaptre_length, presence: true
    validates :time_per_day, presence: true
    validates :available_days, presence: true

    def initialize(attributes)
        attributes.each do |name, value|
            send("#{name}=", value)
        end
    end
end