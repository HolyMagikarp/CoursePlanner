module CalendarHelper
  def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).table
  end
end

class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[Times Monday Tuesday Wednesday Thursday Friday]

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar table table-bordered" do
        header + time_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def time_rows
      times.map do |time|
        content_tag :tr do
          col = -1
          row = time[0]
          time.map do |slot| 
            col += 1
            content_tag :td, slot, class: get_classes(slot), id: "cell-#{row}-#{col}",
            onclick: "toggle(this)"
          end.join.html_safe

        end
      end.join.html_safe
    end

    def get_classes(slot)
      classes = []
      classes << "selected_course" if slot == 8
      classes.empty? ? nil : classes.join(" ")
    end

    def times
      start_time = 8
      end_time = 22

      rows = []
      (start_time..end_time).each do |time|
        rows << [time, nil, nil, nil, nil, nil]
      end
      rows
    end
end
