FactoryBot.define do
    factory :day_calculator do
        chaptres { 30.00 }
        chaptre_length { 45.00 }
        time_per_day { 1.50 }
        available_days { 3.00 }

        initialize_with { new(attributes) }
    end
end  