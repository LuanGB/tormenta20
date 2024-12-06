module Tormenta20
  class Magias
    class << self
      def todas
        @todas ||= OpenStructJson.load('magias')
      end

      def divinas
        return @divinas if @divinas

        @divinas = OpenStruct.new
        @divinas = OpenStructJson.load('magias', include_if: -> (magia) { magia.type == 'divina' })
      end

      def arcanas
        return @arcanas if @arcanas

        @arcanas = OpenStruct.new
        @arcanas = OpenStructJson.load('magias', include_if: -> (magia) { magia.type == 'arcana' })
      end

      def universais
        return @universais if @universais

        @universais = OpenStruct.new
        @universais = OpenStructJson.load('magias', include_if: -> (magia) { magia.type == 'universal' })
      end

      def method_missing(method)
        magia = OpenStructJson.load('magias/' + method.to_s)
        magia || super
      end
    end
  end
end