FactoryBot.define do
    factory :day_calculator do
        chaptres { 2 }
        chaptre_length { 45 }
        time_per_day { 3 }
        available_days { 3 }

        initialize_with { new(attributes) }
    end
end  