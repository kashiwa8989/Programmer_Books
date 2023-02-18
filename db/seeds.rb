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
    { name: 'C#'},
    { name: 'Java'},
    { name: 'JavaScript'},
    { name: 'PHP'},
    { name: 'Ruby'},
    { name: 'HTML/CSS'},
    { name: 'TypeScript'},
    { name: 'Python'},
    { name: 'R言語'},
    { name: 'Go言語'},
    { name: 'Swift'},
    { name: 'AWS（Amazon Web Services）'},
    { name: 'Visual Studio Code'},
    { name: 'ITパスポート'},
    { name: '基本情報技術者'},
    { name: '応用情報技術者'},
    { name: 'IT資格関係'},

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
    { name: 'D言語'},
    { name: 'Perl'},
    { name: 'COBOL'},
    { name: 'SQL'},
    { name: 'FORTRAN'},
    { name: 'MATLAB'},
    { name: 'Scratch'},
    { name: 'Dart'},
    { name: 'その他'}
    ])