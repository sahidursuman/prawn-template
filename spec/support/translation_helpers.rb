module TranslationHelpers

  def assert_translation(key, options = {})
    I18n.t!("prawn/template/simple.#{key}", options)
  end

end
