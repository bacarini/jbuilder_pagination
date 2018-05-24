# frozen_string_literal: true

require 'spec_helper'

describe 'Jbuilder#Pagination' do
  include Pagination
  context 'pagination calls pagination methods' do
    it('works') do
      call_count = 0
      test_pagers = [[:page, ->(_params) { call_count += 1 }], [:per, ->(_params) { call_count += 1 }]]
      paginate(DummyPageable.new, test_pagers, page: { size: 2 })
      expect(call_count).to(eq(2))
    end
  end
  #
  context 'pagination raises error on unpageable resource' do
    it('actually works') do
      test_pagers = [[:page, ->(params) { params }]]
      expect{paginate({ not: :pageable }, test_pagers, page: { size: 2 })}.to(
          raise_error(Pagination::Errors::UnpageableResourceError))
    end
  end

end

class DummyPageable
  def page(_params)
    self
  end

  def per(_params)
    self
  end
end
