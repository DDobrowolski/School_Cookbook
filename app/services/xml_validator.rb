class XmlValidator
  def initialize(message)
  end
  def self.validate(xml, xsd)
    schema = Nokogiri::XML::Schema(xml)
    document = Nokogiri::XML(xsd)
    errors = {errors: []}
    schema.validate(document).each do |error|
      errors.errors << error.message
    end
    errors
  end
end