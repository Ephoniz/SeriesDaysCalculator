FactoryBot.define do
    factory :day_calculator do
        chaptres { 2.00 }
        chaptre_length { 45.00 }
        time_per_day { 3.00 }
        available_days { 3.00 }

        initialize_with { new(attributes) }
    end
end  