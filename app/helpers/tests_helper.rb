module TestsHelper
  def test_header(test)
    if test.persisted?
      t('helpers.tests.header_update', test: @test.title)
    else
      t('helpers.tests.header_create')
    end
  end
end
