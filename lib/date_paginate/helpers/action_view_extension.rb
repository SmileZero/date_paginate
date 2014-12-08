module DatePaginate
  # = Helpers
  module ActionViewExtension
    def date_paginate(options = {})
      paginator = DatePaginate::Helpers::Paginator.new self, options.reverse_merge(date: @date, date_paginate_type: :months, num_pages: 6, :remote => false)
      paginator.to_s
    end

    def date_paginate_months(options = {})
      date_paginate(options.merge(date_paginate_type: :months))
    end

    def date_paginate_weeks(options = {})
      date_paginate(options.merge(date_paginate_type: :weeks))
    end
  end
end
