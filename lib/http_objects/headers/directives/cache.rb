module HttpObjects::Headers
  module Directives

    BasicRules = HttpObjects::Parameters::BasicRules

    class RawValue < BasicRules::Base
      def self.parse(value)
        self.new(value, value)
      end
    end

    # Cache-Control   = "Cache-Control" ":" 1#cache-directive
    #
    # cache-directive = cache-request-directive
    #      | cache-response-directive
    #
    # cache-request-directive =
    #        "no-cache"                          ; Section 14.9.1
    #      | "no-store"                          ; Section 14.9.2
    #      | "max-age" "=" delta-seconds         ; Section 14.9.3, 14.9.4
    #      | "max-stale" [ "=" delta-seconds ]   ; Section 14.9.3
    #      | "min-fresh" "=" delta-seconds       ; Section 14.9.3
    #      | "no-transform"                      ; Section 14.9.5
    #      | "only-if-cached"                    ; Section 14.9.4
    #      | cache-extension                     ; Section 14.9.6
    #
    #  cache-response-directive =
    #        "public"                               ; Section 14.9.1
    #      | "private" [ "=" <"> 1#field-name <"> ] ; Section 14.9.1
    #      | "no-cache" [ "=" <"> 1#field-name <"> ]; Section 14.9.1
    #      | "no-store"                             ; Section 14.9.2
    #      | "no-transform"                         ; Section 14.9.5
    #      | "must-revalidate"                      ; Section 14.9.4
    #      | "proxy-revalidate"                     ; Section 14.9.4
    #      | "max-age" "=" delta-seconds            ; Section 14.9.3
    #      | "s-maxage" "=" delta-seconds           ; Section 14.9.3
    #      | cache-extension                        ; Section 14.9.6
    #
    # cache-extension = token [ "=" ( token | quoted-string ) ]
    class Cache < HttpObjects::Hash

      attr_reader :raw, :value

      register_attribute "no-cache",         RawValue, &MethodCreator
      register_attribute "no-store",         RawValue, &MethodCreator
      register_attribute "max-age",          BasicRules::Digit, &MethodCreator
      register_attribute "max-stale",        BasicRules::Digit, &MethodCreator
      register_attribute "min-fresh",        BasicRules::Digit, &MethodCreator
      register_attribute "no-transform",     RawValue, &MethodCreator
      register_attribute "only-if-cached",   RawValue, &MethodCreator
      register_attribute "public",           RawValue, &MethodCreator
      register_attribute "private",          RawValue, &MethodCreator
      register_attribute "must-revalidate",  RawValue, &MethodCreator
      register_attribute "proxy-revalidate", RawValue, &MethodCreator
      register_attribute "s-maxage",         BasicRules::Digit, &MethodCreator

      def self.parse(value)
        self.new(value)
      end

      def initialize(value)
        @raw = value
        @value = value
      end

    end

  end
end
