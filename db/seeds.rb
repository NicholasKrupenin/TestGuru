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
                       { title: "Asia", level: 1, category_id: categories[2].id, author_id: users[1].id },
                       { title: "File permission", level: 3, category_id: categories[0].id, author_id: users[0].id },
                       { title: "Ganre", level: 2, category_id: categories[3].id, author_id: users[1].id },
                       { title: "Commit file", level: 3, category_id: categories[1].id, author_id: users[1].id },
                     ])

questions = Question.create!([
                               { body: "How modify the full permission for the file", test_id: tests[1].id },
                               { body: "What is the capital of Thailand", test_id: tests[0].id },
                               { body: "How to commit and add all files of only one command", test_id: tests[3].id },
                               { body: "What genre the music is play group Thievery Corporation", test_id: tests[2].id }
                             ])

answers = Answer.create!([
                           { body: "chmod 777 <file>", correct: true, question_id: questions[1].id },
                           { body: "chmod uga+xwr <file>", correct: true, question_id: questions[1].id },
                           { body: "chmod --add-full permission <file>", question_id: questions[1].id },
                           { body: "Bangkok", correct: true, question_id: questions[1].id },
                           { body: "Chiang Mai", question_id: questions[1].id },
                           { body: "Manila", question_id: questions[1].id },
                           { body: "Electronic music", correct: true, question_id: questions[3].id },
                           { body: "Heavy Metal", question_id: questions[3].id },
                           { body: "Bossa nova", correct: true, question_id: questions[3].id },
                           { body: "git commit -a", correct: true, question_id: questions[2].id },
                           { body: "git add + commit", question_id: questions[2].id },
                           { body: "Expecto Patronum", question_id: questions[2].id },
                         ])

test_users = TestUser.create!([
                                { user_id: users[1].id, test_id: tests[1].id },
                                { user_id: users[0].id, test_id: tests[2].id },
                                { user_id: users[1].id, test_id: tests[3].id },
                                { user_id: users[0].id, test_id: tests[0].id },
                              ])
