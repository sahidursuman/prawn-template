require "prawn/template/version"
require "prawn"

module Prawn
  module Template
    class Simple < Prawn::Document

      def initialize(*args)
        super(*args)
        body
        finalize
      end

      private

      def body
      end

      def finalize
        number_pages("Page <page> of <total>",
                     at: [bounds.right - 150, 0],
                     align: :right)
      end

    end
  end
end
