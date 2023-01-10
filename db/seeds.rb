# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
                       { name: "root" },
                       { name: "user" },
                    ])

categories = Category.create!([
                                { title: "Unix" },
                                { title: "Git" },
                                { title: "Country" },
                                { title: "Music" }
                             ])

tests = Test.create!([
                       { title: "Asia", level: 1, category: categories[2], author: users[1] },
                       { title: "File permission", level: 3, category: categories[0], author: users[0] },
                       { title: "Ganre", level: 2, category: categories[3], author: users[1] },
                       { title: "Commit file", level: 3, category: categories[1], author: users[1] },
                     ])

questions = Question.create!([
                               { body: "How modify the full permission for the file", test: tests[1] },
                               { body: "What is the capital of Thailand", test: tests[0] },
                               { body: "How to commit and add all files of only one command", test: tests[3] },
                               { body: "What genre the music is play group Thievery Corporation", test: tests[2] }
                             ])

answers = Answer.create!([
                           { body: "chmod 777 <file>", correct: true, question: questions[1] },
                           { body: "chmod uga+xwr <file>", correct: true, question: questions[1] },
                           { body: "chmod --add-full permission <file>", question: questions[1] },
                           { body: "Bangkok", correct: true, question: questions[1] },
                           { body: "Chiang Mai", question: questions[1] },
                           { body: "Manila", question: questions[1] },
                           { body: "Electronic music", correct: true, question: questions[3] },
                           { body: "Heavy Metal", question: questions[3] },
                           { body: "Bossa nova", correct: true, question: questions[3] },
                           { body: "git commit -a", correct: true, question: questions[2] },
                           { body: "git add + commit", question: questions[2] },
                           { body: "Expecto Patronum", question: questions[2] },
                         ])

test_users = TestUser.create!([
                                { user: users[1], test: tests[1] },
                                { user: users[0], test: tests[2] },
                                { user: users[1], test: tests[3] },
                                { user: users[0], test: tests[0] },
                              ])
