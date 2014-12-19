require 'rails_helper'

describe DatePaginate::Configuration do
  subject { DatePaginate.config }
  describe 'default_num_pages' do
    context 'by default' do
      it { expect(subject.default_num_pages).to eq 6 }
    end

    context 'configured via config block' do
      before do
        DatePaginate.configure {|c| c.default_num_pages = 12}
      end
      it { expect(subject.default_num_pages).to eq 12 }
      after do
        DatePaginate.configure {|c| c.default_num_pages = 6}
      end
    end
  end

  describe 'default_paginate_type' do
    context 'by default' do
      it { expect(subject.default_paginate_type).to eq :months }
    end

    context 'configured via config block' do
      before do
        DatePaginate.configure {|c| c.default_paginate_type = :weeks}
      end
      it { expect(subject.default_paginate_type).to eq :weeks }
      after do
        DatePaginate.configure {|c| c.default_paginate_type = :months}
      end
    end
  end
end
