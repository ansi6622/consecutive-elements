require 'schedule_validator'

describe ScheduleValidator do
  describe 'transformation' do
    it 'can handle no activties' do
      input = []
      expected = []

      expect(ScheduleValidator.new.transform(input)).to eq expected
    end
    it 'can handle one activity' do
      input = ["archery"]
      expected = [
          ["archery", 1],
      ]

      expect(ScheduleValidator.new.transform(input)).to eq expected
    end

    it 'can handle multiple activities' do
      input = ["archery", "swimming", "swimming", "crafts", "archery", "archery", "crafts"]
      expected = [
          ["archery", 1],
          ["swimming", 2],
          ["crafts", 1],
          ["archery", 2],
          ["crafts", 1],
      ]

      expect(ScheduleValidator.new.transform(input)).to eq expected
    end
  end

  describe 'validation' do
    it 'returns true if the schedule has all activities twice' do
      input = [
          ["archery", 2],
          ["swimming", 2],
          ["archery", 2],
      ]

      expect(ScheduleValidator.new.valid?(input)).to eq true
    end

    it 'returns false if the schedule does not have all activities twice' do
      input = [
          ["archery", 2],
          ["swimming", 1],
          ["archery", 2],
      ]

      expect(ScheduleValidator.new.valid?(input)).to eq false
    end

    it 'returns true if the schedule has the last activity is one' do
      input = [
          ["archery", 2],
          ["swimming", 2],
          ["archery", 2],
          ["pottery", 1],
      ]

      expect(ScheduleValidator.new.valid?(input)).to eq true
    end

    it 'raises an exception if you give it an empty array'
  end
end