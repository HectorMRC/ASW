# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Default", email: "deafult@test.fake", password: "12341234", personalName: "Pedro Picapiedra")
User.create(username: "Dummy_1", email: "dummy1@test.fake", password: "12341234", personalName: "Pedro Picapiedra")
User.create(username: "Dummy_2", email: "dummy2@test.fake", password: "12341234", personalName: "Pedro Picapiedra")

Issue.create(userCreator: 1, idUserAssignee: 1, title: 'First issue!', description: 'Ns/Nr', issueType: 'bug', priority: 'major', status: 'NEW', votes: "trolo", creationDate: DateTime.now.to_date, updated: DateTime.now.to_date)
Issue.create(userCreator: 1, idUserAssignee: 1, title: 'First issue!', description: 'Ns/Nr', issueType: 'bug', priority: 'major', status: 'NEW', votes: "trolo", creationDate: DateTime.now.to_date, updated: DateTime.now.to_date)
Issue.create(userCreator: 2, idUserAssignee: 1, title: 'Assigned issue', description: 'Ns/Nr', issueType: 'improvement', priority: 'trivial', status: 'NEW', votes: 3, creationDate: DateTime.now.to_date, updated: DateTime.now.to_date)
