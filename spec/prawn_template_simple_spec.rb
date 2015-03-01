require "spec_helper"

module TestDocument
  class Simple < Prawn::Template::Simple

    def body
      text t(:content)
      2.times do
        start_new_page
      end
    end

  end
end

describe Prawn::Template::Simple do
  include TranslationHelpers

  subject { TestDocument::Simple.new }

  def rendered
    subject.render
  end

  def text_analysis
    PDF::Inspector::Text.analyze(rendered)
  end

  def xobject_analysis
    PDF::Inspector::XObject.analyze(rendered)
  end

  it { should be_a_kind_of Prawn::Document }

  it "has a title on the first page"

  it "has a logo on the first page" do
    expect(xobject_analysis.page_xobjects.first.size).to eq(1)
  end

  it "has a footer on all pages"

  it "has page numbers on all pages" do
    expect(text_analysis.strings).to include("Page 1 of 3",
                                             "Page 2 of 3", "Page 3 of 3")
  end

  it "translates the content" do
    expect(text_analysis.strings).to include(assert_translation(:content))
  end

  it "has a the current date in long format on the first page"

  describe "#filename" do
    it "has a default filename if not set" do
      expect(subject.filename).to eq(subject.class.name.downcase.split('::').join('_') + '.pdf')
    end

    it "uses the defined filename if set"
  end

  describe "#render_file" do
    it "renders a file with the filename set"
  end

end
