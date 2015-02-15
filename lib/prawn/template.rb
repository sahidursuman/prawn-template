require "prawn/template/version"
require "prawn"
require "i18n"

I18n.load_path = ["config/locales/en.yml"]
I18n.default_locale = :en

module Prawn
  module Template
    DATADIR = "data/"

    class Simple < Prawn::Document

      def initialize(*args)
        super(*args)
        logo
        body
        finalize
      end

      private

      def body
      end

      def finalize
        number_pages(
          t(:number_pages), at: [bounds.right - 150, 0], align: :right
        )
      end

      def logo
        image "#{Prawn::Template::DATADIR}/logos/default.png", width: 100, position: :right
      end

      def t(string, options = {})
        I18n.t("prawn/template/simple.#{string}", options)
      end

    end
  end
end
