require 'rails_helper'


RSpec.describe DayCalculator, type: :model do    
    describe '#validations' do
        it 'should test that the factory is valid' do
            day_calculator = build :day_calculator
            expect(day_calculator.chaptres).to be_present
            expect(day_calculator.chaptre_length).to be_present
            expect(day_calculator.time_per_day).to be_present
            expect(day_calculator.available_days).to be_present

        end

        it 'should validate the presence of the chaptres' do
            day_calculator = build :day_calculator, chaptres: ''
            expect(day_calculator).not_to be_valid
            expect(day_calculator.errors.messages[:chaptres]).to include("can't be blank")
        end

        it 'should validate the presence of the chaptre_length' do
            day_calculator = build :day_calculator, chaptre_length: ''
            expect(day_calculator).not_to be_valid
            expect(day_calculator.errors.messages[:chaptre_length]).to include("can't be blank")
        end

        it 'should validate the presence of the time_per_day' do
            day_calculator = build :day_calculator, time_per_day: ''
            expect(day_calculator).not_to be_valid
            expect(day_calculator.errors.messages[:time_per_day]).to include("can't be blank")
        end

        it 'should validate the presence of the available_days' do
            day_calculator = build :day_calculator, available_days: ''
            expect(day_calculator).not_to be_valid
            expect(day_calculator.errors.messages[:available_days]).to include("can't be blank")
        end

        it 'should validate that all values are float' do
            day_calculator = build :day_calculator, chaptres: '3.4', chaptre_length: '3', time_per_day: '45.5', available_days: '2'
            expect(day_calculator.chaptres).to be_kind_of(Float)
            expect(day_calculator.chaptre_length).to be_kind_of(Float)
            expect(day_calculator.time_per_day).to be_kind_of(Float)
            expect(day_calculator.available_days).to be_kind_of(Float)
        end

        it 'should validate the entry of strings' do
            day_calculator = build :day_calculator, chaptres: 'unvalid_value'
            expect(day_calculator).not_to be_valid
        end
    end

    describe "#total_time" do
        context "will calculate the total amount of time needed for complete the tv show" do
            it 'should properly calculate the total_time' do
                day_calculator = build :day_calculator
                expect(day_calculator.total_time).to eq(1350.0)

            end
        end
    end

    describe "#total_days" do
        context "will calculate the total amount of days needed based on the time_per_day" do
            it 'should properly calculate the total amount of days' do
                day_calculator = build :day_calculator
                expect(day_calculator.total_days).to eq(15)
            end

            it 'should round to the highest value when odd value' do
                day_calculator = build :day_calculator, time_per_day: 3
                expect(day_calculator.total_days).to eq(8)
            end
        end
    end

    describe "#chaptres_per_day" do
        context "will calculate the maximum amount of chaptres per day" do
            it 'should properly calculate the chaptres_per_day' do
                day_calculator = build :day_calculator
                expect(day_calculator.chaptres_per_day).to eq(2)
            end
        end
    end
end