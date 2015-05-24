module DatePaginate
  # = Helpers
  module ActionViewExtension
    def date_paginate(options = {})
      default_options = {
        date:               @date,
        date_paginate_type: DatePaginate.config.default_paginate_type,
        num_pages:          DatePaginate.config.default_num_pages,
        remote:             false
      }

      paginator = DatePaginate::Helpers::Paginator.new self, options.reverse_merge(default_options)
      paginator.to_s
    end

    def date_paginate_days(options = {})
      date_paginate(options.merge(date_paginate_type: :days))
    end

    def date_paginate_weeks(options = {})
      date_paginate(options.merge(date_paginate_type: :weeks))
    end

    def date_paginate_months(options = {})
      date_paginate(options.merge(date_paginate_type: :months))
    end
  end
end
