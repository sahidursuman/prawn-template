require "spec_helper"

class TestDocument < Prawn::Template::Simple

  def body
    text t(:content)
    2.times do
      start_new_page
    end
  end

end

describe Prawn::Template::Simple do
  include TranslationHelpers

  subject { TestDocument.new }

  def text_analysis
    PDF::Inspector::Text.analyze(subject.render)
  end

  it { should be_a_kind_of Prawn::Document }

  it "has a title on the first page"
  it "has a logo on the first page"
  it "has a footer on all pages"

  it "has page numbers on all pages" do
    expect(text_analysis.strings).to include("Page 1 of 3", "Page 2 of 3", "Page 3 of 3")
  end

  it "translates the content", focus: true do
    expect(text_analysis.strings).to include(assert_translation(:content))
  end

  it "has a the current date in long format on the first page"

end
