module TestsHelper
  def test_header(test)
    if test.persisted?
      "Edit test '#{test.title}'"
    else
      "Create New Test"
    end
  end
end
