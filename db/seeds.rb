# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'sample-email@admin',
   password: 'admin1'
)

Tag.create([
    { name: 'C言語' },
    { name: 'C＋＋' },
    { name: 'Java'},
    { name: 'C#'},
    { name: 'JavaScript'},
    { name: 'PHP'},
    { name: 'Ruby'},
    { name: 'TypeScript'},
    { name: 'Python'},
    { name: 'R言語'},
    { name: 'Go言語'},
    { name: 'Swift'},
    { name: 'Kotlin'},
    { name: 'Objective-C'},
    { name: 'Visual Basic'},
    { name: 'BASIC'},
    { name: 'Google Apps Script'},
    { name: 'Haskell'},
    { name: 'Scala'},
    { name: 'Groovy'},
    { name: 'Delphi'},
    { name: 'Dart'},


    { name: 'Delphi'},

    { name: 'Dart'}

    ])