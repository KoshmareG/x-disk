require 'rails_helper'

RSpec.describe RecordsHelper, type: :helper do
  describe '#available_disk_space' do
    it 'returns 4.0' do
      expect(helper.available_disk_space(6_000_000)).to eq(4.0)
    end

    it 'returns 3.72' do
      expect(helper.available_disk_space(6_280_120)).to eq(3.72)
    end
  end
end
