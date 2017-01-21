# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

connection = ActiveRecord::Base.connection()

def seed_unit name, abbr, factor, category
  unit = Unit.find_by_name name
  unless unit
    Unit.create name: name, abbrevation: abbr, unit_factor: factor, category: category
  end
end

def seed_language iso_639_1, iso_639_2, name
  unit = Language.find_by_iso_639_1 iso_639_1
  unless unit
    Language.create iso_639_1: iso_639_1, iso_639_2: iso_639_2, name: name
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
seed_unit('Stück ', 'St.', 1.0, :piece)
seed_unit('Blat ', 'Bl.', 1.0, :piece)
seed_unit('Bund ', 'Bd.', 1.0, :piece)
seed_unit('Päckchen', 'PK', 1.0, :piece)
seed_unit('Dutzend', 'Dtzd', 12.0, :piece)
seed_unit('Gros', 'gr', 144.0, :piece)

seed_language('de', 'deu', 'Deutsch')
seed_language('en', 'eng', 'English')

User.find_each do |user|
  user.language = Language.first unless user.language
  user.save
end

Blog.find_each(&:save)
Recipe.find_each(&:save)
Ingredient.find_each(&:save)


