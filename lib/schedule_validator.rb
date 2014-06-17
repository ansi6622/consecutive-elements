class ScheduleValidator
  def transform(data)
    answer = []

    data.each_with_index do |item, index|
      last_item = data[index-1] unless index == 0

      if last_item == item
        answer.last[1] += 1
      else
        answer << [item, 1]
      end
    end

    answer
  end

  def valid?(input)
    beginning_of_list =  input[0...-1]
    beginning_of_list.none? { |item| item[1] == 1 }
  end
end