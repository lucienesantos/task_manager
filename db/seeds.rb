# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


makro = Makro.create(name: 'Reforma da Cozinha')
makro.keeps.create(title: 'Cotar Custos da Reforma', completed: true, completed_at: Time.now)
makro.keeps.create(title: 'Cotar Revestimento', completed: true, completed_at: Time.now - 2.hours)
makro.keeps.create(title: 'Contratar Pintor', started: true, started_at: Time.now - 2.days)
makro.keeps.create(title: 'Orçamento para ampliação da Dispensa')
makro.keeps.create(title: 'Comprar Pia 2m')
makro.keeps.create(title: 'Torneira Inox')
makro.keeps.create(title: 'Orçar Armários Planejada')

goals = Makro.create(name: 'Metas Diárias')
goals.keeps.create(title: 'Estudar Phoenix/Elixir 2 horas', completed: true, completed_at: Time.now - 3.hours)
goals.keeps.create(title: 'Terminar esta Tarefa')
goals.keeps.create(title: 'Começar esta Tarefa', started: true, started_at: Time.now - 1.hour)
goals.keeps.create(title: 'Dormir 8 Horas')

netflix = Makro.create(name: 'Netflix Movie List')
netflix.keeps.create(title: 'Black Mirror', completed: true, completed_at: Time.now - 2.hours)
netflix.keeps.create(title: 'Elefante Branco')
netflix.keeps.create(title: 'Mr. Robot', started: true, started_at: Time.now - 1.week)
netflix.keeps.create(title: 'Strange Things', started: true, started_at: Time.now - 1.month)
netflix.keeps.create(title: 'Clube da Luta')
netflix.keeps.create(title: 'Tudo Sobre Minha Mãe')
netflix.keeps.create(title: 'Sherlock')
