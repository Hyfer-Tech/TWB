module CountriesList
  extend ActiveSupport::Concern

  included do
    def countries
      country = ISO3166::Country
      country.all.map do |c|
        {name: c.name, code: c.gec}
      end
    end
  end
end
