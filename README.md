Todo
- URL DONE
- Sreenshots DONE
- User Stories DONE
- Wireframes DONE
- ERD DONE
- Third party services DONE
- Slide Deck DONE
- Description DONE
  - Purpose DONE
  - Features DONE
  - Sitemap DONE
  - Target Audience DONE
  - Tech Stack DONE
- Identification of problem being solved DONE
- Why is it a problem that needs solving DONE

NOT DONE

- Database Schema
- Describe the way tasks are allocated and tracked
- Discuss the database relations
- Describe the models in terms of relationships they have with each other
- Explain the different high-level components (abstractions) in your app

#OPEN LANGUAGES README

###Samuel O'Donnell T2A2 Marketplace Application

### Links
[Open Langauges Website](https://open-languages.herokuapp.com/)

[Open Languages Repo](https://github.com/PotatoBaron89/Open_Langauges)

[ERD Link 1 LucidChart](https://lucid.app/lucidchart/3a3c8154-1349-4154-846b-944135d7b0d3/edit?viewport_loc=1937%2C-41%2C1715%2C1532%2C0_0&invitationId=inv_dc6f0c99-ef48-464e-bec3-bfe7ba7f4096)

[ERD Link 2 PNG](https://imgur.com/a/sBLR5jN)

[UserStories Link Trello](https://trello.com/invite/b/k5bZmGHE/3fbdea456775dc9eb67030ccaf4c44b1/t2a3-trelloboard)

[UserStories Link Trello - Backup](https://trello.com/b/k5bZmGHE/t2a3-trelloboard)

![UserStores PNG](https://i.imgur.com/11fKDHS.png)


##The Problem Being Solved

Learning resources can be very decentralised.  You may have a textbook with all your core reading, flashcards on one site, notes somewhere else.  It can be a lot to keep things properly managed.

This is a problem because it can impact our efficiency as we try to learn new things.  Open Languages hopes to solve this problem by providing a centralised learning platform  that will eventually contain all the resources and tools one could need.  The initial release of Open Languages will include an array of features such as: Courses, Lessons, Quizzes, Flashcards, Vocab Tools (still in alpha) and chat functionality.  This represents the MVP for the site.   (Note that these features will be explored in more depth later.)

####How does it solve the problem?

As alluded to before, Open Languages attempts to solve this problem by providing a centralised platform for students to learn, complete with frequently needed tools.

## About Open Languages

###Purpose

Open Languages is a centralised two way learning platform.  It is two way in that anyone can create an Account and become an Educator, with no barriers to entry; and on the flip side, any user can create an account and begin looking for Courses that they would like to study.  If there is something in specific they'd like to learn, they can use the search functionality to have a look for it.  

The purpose is to create an environment in which anyone can create courses, lessons, quizzes etc to contribute to site's overall echo-system and where users can find content on courses that interest them.

**N.B. Due to the use of the Gem FAKER, much of the content on the site is NOT relevant to learning languages.  However, this may also open an opportunity to broadening the scope of the project in the future.  Eg, transition into open learning, perhaps.**  

##Features

There are many planned features, we will discuss both MVP features and future features.

###MVP Features

- Anyone can become an Educator
  - Courses: Open Languages will feature a collection of courses, complete with various other features which we will discuss soon.  As mentioned earlier, it is setup so that anyone can become an Educator and create their own Course. All they have to do is simply go to the `Accounts` page and click `Become an Educator`.
    - Rich Text Editor, allowing you to create meaningful and impactful courses with all the tools and trimmings that a rich text editor allows.
    - Lessons: Create Lessons which are children to the course.  Allows you to split your content into more focused sections.  (Features of lessons will be discussed soon)
    - Misc Features:
        - Indicators for `New`, `Recently Updated` and `Archived` courses.
        - Youtube Embedding Support, allowing you to link relevant Youtube videos to provide more depth and content.
        - (Alpha) Ability to invite other educators who can assist with creating / editing / maintaining your Courses and Lessons 
        - Basic implementation of `Social` features, `like`, `subscribe` and `wish`.
        - Convenient Navigation options, both for anchors and lessons
        - Student and Educator Information panel.  See how many educators and students there are.  If you have permission you can also see a list of those educators and students.
    - Lessons: Lessons are were the main meat and potatoes of your content should go.  Like Courses, it supports `rich text editting` and:
      - Useful Information: Who created the course, when it was created and when it was last editted.
      - Anchor Links to other sections of the page in various places, since Lessons can be quite long it was important that users could quickly find parts of the page quickly.
      - Convenient Links for those with proper access rights to Edit and Delete the lesson.
      - Ability to create quizzes which are anchored to the Lesson. (Quizzes will be discussed soon). For now, only educators can create, edit and destroy quizzes.
        - Students will see a list of Quizzes.  Educators will also have a form included for creating new Quizzes.
      - Ability to create Flashcard Lists, which are also anchored to the Lesson. For now, only educators can create, edit and destroy quizzes.
      - Students will see a list of Flashcard Collections.  Educators will also have a form included for creating new Flashcard Collections.
    - Quizzes: Provides contextual all in one page.  If you have sufficient privileges it will include a form for creating more questions. Quizzes offer a useful tool to help students study.  Quizzes include various modes, `Hints enabled`, which will allow hints to be rendered to the students.  `Is test?`, if this is true then students will be able to view the answer as well. This mode is intended for practicing, as opposed to grading.
      - Hints: If the corresponding option is enabled in the Quiz form, students will have access to hints via a drop down menu
        An example of the hints tab (note this is Admin view, includes Edit and Delete which students would not see)

![Hints](https://i.imgur.com/jsoJeqz.png)
- Answer: If the corresponding option is enabled in the Quiz form, students will have access to the answer tab which displays the answer.

![Answer](https://i.imgur.com/QNsDEn9.png)


- Contextual Access to editing and deleting options (Students won't see these options)
- (Alpha) Ability to submit your answers to have them graded.  `Currently this feature is in early development and is not finished.`


####Flashcards
- Contextual Form: Educators will have access to a contextual form for creating new Flashcards.  Since we know you may need to create many Flashcards, it has been built using `Turbo` which means that you can create and have new flashcards appear without needing to refresh your browser. This form will not appear for students.
- Shuffle: Option to shuffle the cards so that you don't have to worry about memorising the answer based on its location, but rather the prompt on the card.
- Animated flash cards

![Animated Flashcards](https://i.imgur.com/srVk3xr.png)

- Pagination, so that performance doesn't suffer if you visit a list with massive numbers of flashcards.

####Messenger App (Test Build)

Open Languages includes a basic Messenger app, allowing you to communicate with fellow students and educators.  Similar to slack, the messenger App includes a channel select layout, where users can view, join and leave channels at their leisure.

![Messenger App](!https://i.imgur.com/srVk3xr.png)

Note, future versions will include an enhanced version of this.  For one, it will include private chat channels for specific courses and lessons, as well as the ability to private message (PM) other users.




###Sitemap

Note that some pages can be accessed from anywhere, via the Header.

![Sitemap](https://i.imgur.com/i2YoKTG.png)

###Screenshots

![Imgur Gallery](https://imgur.com/a/YF7Cosw)

Landing Page

![Landing Page](https://i.imgur.com/kj3L93Q.png)

Landing page 2

![Landing Page Part 2](https://i.imgur.com/0wfOyhR.png)

Course Listings

![Course Listings](https://i.imgur.com/CgZWdrb.png)

Course Show

![Course Show](https://i.imgur.com/2gCsw9o.png)

Course Show 2

![Course Show 2](https://i.imgur.com/cb2zvV1.png)

Lesson Show

![Lesson Show](https://i.imgur.com/IHNHBI5.png)

Lesson Show 2

![Lesson Show 2](https://i.imgur.com/jdYmRIK.png)

Flashcards

![Flashcards](https://i.imgur.com/zlwilMR.png)

Quizzes

![Quizzes](https://i.imgur.com/s5RNi9E.png)

Chat App

![Chat App](https://i.imgur.com/il2gr0B.png)

Account Page

![Account Page](https://i.imgur.com/SCI26T8.png)

Admin Dashboard

![Admin Dashboard](https://i.imgur.com/zdceS0J.png)

Word Management (Alpha)

![Word Management, Alpha](https://i.imgur.com/XcfRwvH.png)

Word Management 2 (Alpha)

![Word Management 2, Alpha](https://i.imgur.com/TBLAk2z.png)



###Target Audience

The target audience for Open Languages includes anyone who is interested in Learning a language, or anyone who is interested in teaching a language.  As mentioned earlier, the scope of this may expand to include any educational topic in general.


###Tech Stack

Open Languages is built using Ruby On Rails and Tailwind.  For now, it also includes Bootstrap which is used for a couple elements that require Javascript which we have not covered yet.  Bootstrap will be removed and will be replaced with custom JS in the future to reduce on unnecessary bloat.  AWS S3 was used to handle file hosting.

###Wireframes

[Imgur Link To Wireframe Collection](https://imgur.com/a/WYXbLYd)

##Desktop

Landing Page Desktop

![Landing Page Desktop](https://i.imgur.com/5Rl7Kta.png)

Course Index Desktop

![Course Index Desktop](https://i.imgur.com/LlyUFRb.png)

Course Show Desktop

![Course Show Desktop](https://i.imgur.com/KUeS1lK.png)

Lesson Show Desktop

![Lesson Show Desktop](https://i.imgur.com/rcICGXi.png)

Quiz Page Desktop

![Landing Page Desktop](https://i.imgur.com/3TNTFiB.png)

Flashcard Page Desktop

![Flashcard Page Desktop](https://i.imgur.com/MyI3Mls.png)


##Tablet

Landing Page Tablet

![Landing Page Tablet](https://i.imgur.com/U4auuIz.png)

Course Index Tablet

![Course Index Tablet](https://i.imgur.com/NMijTF3.png)

Course Show Tablet

![Course Show Tablet](https://i.imgur.com/sGUt8VV.png)

Lesson Show Tablet

![Lesson Show Tablet](https://i.imgur.com/MfbBgU7.png)

Quiz Page Tablet

![Landing Page Tablet](https://i.imgur.com/IgzKGai.png)

Flashcard Page Tablet

![Flashcard Page Tablet](https://i.imgur.com/CRvlgph.png)


##Mobile

Landing Page Mobile

![Landing Page Mobile](https://i.imgur.com/rJ4xdGo.png)

Course Index Mobile

![Course Index Mobile](https://i.imgur.com/OAojF9l.png)

Course Show Mobile

![Course Show Mobile](https://i.imgur.com/HJvtD7y.png)

Lesson Show Mobile

![Lesson Show Mobile](https://i.imgur.com/bZTfOLm.png)

Quiz Page Mobile

![Landing Page Mobile](https://i.imgur.com/yBf12VE.png)

Flashcard Page Mobile

![Flashcard Page Mobile](https://i.imgur.com/XSobqbc.png)



##Third party Services

- Web Hosting: Hosting is provided through Heroku

- File Hosting: AWS S3 is used to handle storage of assets such as images and any other files which may need to be stored.

- Skylight: Database and page efficiency monitoring.

- Sentry: Notification or errors + Error logs

####Gems:

- Hotwire-Rails
- TurboLinks
- Devise
- DotENVRails
- Tailwindcss-rails
- Geocoder
- Image Processing
- Store Attribute
- Sentry
- AWS SDK S3
- Rolify
- Skylight
- Font-awesome-rails
- Pagy
- Faker
- Pundit


####Development:
- Better Errors
- Annotate
- Bullet
- Slack-Notifier
- Rails best practices
- Prettier
- Rubocop

##Models


- Channel: The channel table is responsible for managing what channels currently exist, eg 'English', 'French', 'Japanese' tables, and thus providing more focused topics for users to discuss withing that channel.  Every channel can have multiple users and a user can be in multiple tables.  Each table contains multiple messages.  Each message belongs to a channel and a user.
  - A channel can have many users, a user can have many channels (Channel User Join table)
  - A channel has many messages. A message belongs to a channel.
- Channel User (JOIN TABLE) Allows a many to many relationship between Users and Channels
- Class Educator (JOIN TABLE) Allows a many to many relationship between Courses and Users, functions as an 'educator' list.
- Class List (JOIN TABLE) Allows a many to many relationship between Courses and Users, functions as an 'student' list.
- Course: The course model acts as a node for all content related to courses. It links to users in several ways, user_id (creator) and then through both Educator List and Class List (Both Join tables), allowing a many to many connection.  All primary content related to Courses is fed through this model (ie. Lessons, Quizzes, Flashcards, VocabLists)
  - A course belongs to a user (creator). A creator can have many courses.
  - Courses have many lessons. A lesson belongs to a course.
  - (JOIN) A course can have many educators, using Class Educator as a join table.
  - (JOIN) A course can have many students, using Class List as a join table.
- Definition: The definition model relates to the word model, and it allows the word model to have multiple definitions per word.
  - A definition belongs to a word. A word definitions.
- Flashcard: The flashcard model contains information specific to each individual flashcard. Each Flashcard links directly to a flashcard list, which in turn belongs to a lesson.
  - A flashcard belongs to a flashcard list. A flashcard list can have many flashcards.
- Flashcard Course: Unimplemented model, will be included in a future build
- Flashcard List:  The flashcard list belongs to a Lesson, and contains many flashcards.  It acts as the main facilitator for our flashcard system.
  - A flashcard list belongs to a lesson. A lesson can have many flashcard lists.
  - A flashcard list can have many flashcards. A flashcard must belong to a lesson.
- Lesson: One of our most important models, and it is the one in which most of our content stems.  Lessons are designed to contain core learning material, whereas the Courses model provides an overview of the information contained within the lessons.  The lesson model also allows us to link relevant learning material from it, such as flashcard lists, quizzes and vocab lists.
  - Lessons belong to a Course. A Course can have many Lessons.
  - A lesson can have many Quizzes. A quiz can only have one course.
  - A lesson can have many flashcard lists. A flashcard list can only have one lesson.
  - A lesson belongs to a user (creator), a user can have many lessons.
  - A lesson can have many Lesson Vocab (lists, alpha), a Lesson vocab belongs to a Lesson.
- Like: The like model simply allows us to track what user likes what course.
  - A like belongs to one user. A user can have many likes.
- Message: The like model simply allows us to message what user likes what user.
  - A message belongs to one user. A user can have many messages.
- Organisation: Unimplemented model, will be included in a future build
- Question:
  - Question belongs to Quiz. A quiz can have many questions.
- Quiz: The Quiz model is responsible for handling data relevant to quizzes. It will link to the questions table allowing a quiz to contain any number of quizzes.  However, every quiz must belong to a user and a lesson.
  - A quiz can have many questions. A question belongs to a quiz.
  - A quiz belongs to a lesson.
- Role: Part of Rolify
- Subscribe:  The subscribe feature isn't fully implemented as intended.  It is to act as the model that dictates when a user has subscribed to a premium course.  If a user is subscribed to a course, they will be able to access a course even if it later becomes archived.
  - A wish belongs to one user. A user can have many subscribes.

- User: The user model is for tracking relevant information to each user to the site, information relevant to them and linking other models which rely on having a User (discussed below.)
  - Has a one to many relationship to Messages.  A user may have many messages but a message can only belong to a single user.
  - Has a one to many relationship to Channels.  However, Channels has a many to one relationship to Users as well, which requires the join table `Channel Users`
  - Has a one to many relationship to Roles.  A User may have many roles.
  - Has a one to many relationship to Subscriptions. A user may have many subscriptions, but a subscription cannot have many users.
  - Has a one to many relationship to Likes. A user may have many subscriptions, but a like cannot have many users.
  - Has a one to many relationship to Wishes. A user may have many wishes, but a like cannot have many users.
  - Has a one to many relationship to courses (creator), a course can only have one creator, but a creator can have many courses.
  - (JOIN) User can have one to many relationship to Educator List (educator). A user can be in an educator of many classes
  - (JOIN) User can have one to many relationship to Class List (student). A user can be in an student of many classes
- Wish:
  - A wish belongs to one user.
- Word:
- Youtube: For handling Youtube Embedding in Wix Editor.


###Models which are part of unfinished Features

- Grade: Unimplemented model, will be included in a future build
- Inbox: Unimplemented model, will be included in a future build
- Tag: Unimplemented model, will be included in a future build
- Tag List: Unimplemented model, will be included in a future build
- Result: Early alpha, not properly implemented.
- Course Category: Unimplemented model, will be included in a future build
- Course Channel: Unimplemented model, will be included in a future build
- Course Tag: Unimplemented model, will be included in a future build
- Category: Unimplemented model, will be included in a future build
- Lesson Result: Unimplemented model, will be included in a future build
- Lesson Vocab: Early alpha, not properly implemented.


- Describe the way tasks are allocated and tracked
- Discuss the database relations
- Describe the models in terms of relationships they have with each other
###Database Schema


###How tasks are allocated and tracked