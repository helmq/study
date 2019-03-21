module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        films_filtered = array.reject { |film| film['country'].nil? }
                              .select { |film| film['country'].split(',').size >= 2 }
                              .reject { |film| film['rating_kinopoisk'].nil? }
                              .select { |film| film['rating_kinopoisk'].to_i.positive? }
        kinopoisk_ratings = films_filtered.map { |film| film['rating_kinopoisk'].to_f }
        kinopoisk_rating_sum = kinopoisk_ratings.reduce(:+)
        films_count = films_filtered.size
        kinopoisk_rating_sum / films_count
      end

      def chars_count(films, threshold)
        films_filtered = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        films_names = films_filtered.map { |film| film['name'] }
        letters = films_names.map { |name| name.split('') }.flatten
        letters.select { |l| l == 'и' }.size
      end
    end
  end
end
