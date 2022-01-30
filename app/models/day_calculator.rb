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
            value = parse_string_to_float(value)

            send("#{name}=", value)
        end
    end

    def total_time
        chaptres * chaptre_length
    end
    
    def total_days
        (total_time / (time_per_day * 60)).ceil
    end

    def chaptres_per_day
        ((time_per_day * 60) / chaptre_length).floor()
    end

    private

    def parse_string_to_float(str)
        str.to_f if valid_float?(str)
    end

    def valid_float?(str)
        !!Float(str) rescue false
    end
end