# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

connection = ActiveRecord::Base.connection()

def seed_unit name, abbr, factor, category
  unit = Unit.find_by_name name
  unless unit
    Unit.create name: name, abbrevation: abbr, unit_factor: factor, category: category
  end
end

seed_unit('Gramm', 'g', 0.001, :weight)
seed_unit('Kilogramm', 'kg', 1.0, :weight)
seed_unit('Milliliter', 'ml', 0.001, :volume)
seed_unit('Liter', 'l', 1.0, :volume)
seed_unit('Prise', 'Prise', 0.000625, :volume)
seed_unit('Teelöffel', 'TL', 0.005, :volume)
seed_unit('Esslöffel', 'EL', 0.015, :volume)
seed_unit('Tasse', 'Tasse', 0.125, :volume)
seed_unit('Stück ', 'St.', 1.0, :piece)
seed_unit('Dutzend', 'Dtzd', 12.0, :piece)

Blog.find_each(&:save)
Recipe.find_each(&:save)
Ingredient.find_each(&:save)
User.find_each(&:save)
