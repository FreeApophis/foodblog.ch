# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

connection = ActiveRecord::Base.connection()

def seed_unit name, abbr, factor, category
  unit = Unit.find_by_name name
  unless unit
    Unit.create name: name, abbrevation: abbr, unit_factor: factor, category: category
  end
end

def seed_locale name, english_name, locale, language_code, country_code
  l = Locale.find_by_locale locale
  unless l
    Locale.create name: name, english_name: english_name, locale: locale, language_code: language_code, country_code: country_code
  end
end

seed_unit('Milligramm', 'g', 0.000001, :weight)
seed_unit('Gramm', 'g', 0.001, :weight)
seed_unit('Dekagramm', 'dag', 0.01, :weight)
seed_unit('Kilogramm', 'kg', 1.0, :weight)
seed_unit('Mikroliter', 'ml', 0.000001, :volume)
seed_unit('Milliliter', 'ml', 0.001, :volume)
seed_unit('Centiliter', 'cl', 0.01, :volume)
seed_unit('Deziliter', 'dl', 0.1, :volume)
seed_unit('Liter', 'l', 1.0, :volume)
seed_unit('Tropfen', 'Tr', 0.00005, :volume)
seed_unit('Spritzer', 'Spr', 0.0006, :volume)
seed_unit('Schuss', 'Schuss', 0.025, :volume)
seed_unit('Prise', 'Prise', 0.0005, :volume)
seed_unit('Messerspitze', 'Msp.', 0.00025, :volume)
seed_unit('Teelöffel', 'TL', 0.005, :volume)
seed_unit('Esslöffel', 'EL', 0.015, :volume)
seed_unit('Tasse', 'Ta', 0.125, :volume)
seed_unit('Stück , 'St.', 1.0, :piece)
seed_unit('Blatt', 'Bl.', 1.0, :piece)
seed_unit('Bund', 'Bd.', 1.0, :piece)
seed_unit('Päckchen', 'PK', 1.0, :piece)
seed_unit('Dutzend', 'Dtzd', 12.0, :piece)
seed_unit('Gros', 'gr', 144.0, :piece)

seed_locale('Deutsch', 'German', 'de', 'de', '')
seed_locale('Deutsch (Schweiz)', 'German', 'de-ch', 'de', 'ch')
seed_locale('English', 'English', 'en', 'en', '')

User.find_each do |user|
  user.locale = Locale.find_by_locale('de-ch') unless user.locale
  user.save
end

Blog.find_each(&:save)
Recipe.find_each(&:save)
Ingredient.find_each(&:save)


