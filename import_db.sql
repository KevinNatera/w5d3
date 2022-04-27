PRAGMA foreign_keys = ON;

DROP TABLE question_likes;
DROP TABLE question_follows;
DROP TABLE  replies;
DROP TABLE  questions;
DROP TABLE  users;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    reply_id INTEGER,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);



INSERT INTO 
    users(fname,lname)
VALUES
    ('Kevin','Natera'),
    ('Some','Person'),
    ('Anon','Guy'),
    ('Random','Human');



INSERT INTO
    questions(title,body,user_id)
VALUES
    ('Sort Question', 'Why is Bubble Sort trash?', (SELECT id FROM users WHERE fname = 'Kevin')),
    ('Random Question 342', 'weiurwhrewhoew', (SELECT id FROM users WHERE fname = 'Some')),
    ('Random Question 983765', 'sjfbdskfnwnlfe', (SELECT id FROM users WHERE fname = 'Anon')),
    ('Random Question 098765', 'djfbckjlnfew', (SELECT id FROM users WHERE fname = 'Random')),
    ('Random Question 0987654', 'dslkvmfwperkwoifwe?', (SELECT id FROM users WHERE fname = 'Kevin')),
    ('Random Question 98765', 'weoifhoejfoiwnfiownl', (SELECT id FROM users WHERE fname = 'Anon'));



INSERT INTO
    question_follows(user_id,question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Kevin'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Some'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Random'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Random'), (SELECT id FROM questions WHERE title = 'Random Question 342'));



INSERT INTO
    replies(body,user_id,question_id,reply_id)
VALUES 
    ('because it''s trash',(SELECT id FROM users WHERE fname = 'Anon'), (SELECT id FROM questions WHERE title = 'Sort Question'), NULL),
    ('LOL',(SELECT id FROM users WHERE fname = 'Kevin'), (SELECT id FROM questions WHERE title = 'Sort Question'), 1),
    ('wat',(SELECT id FROM users WHERE fname = 'Random'), (SELECT id FROM questions WHERE title = 'Random Question 0987654'), NULL),
    ('what*',(SELECT id FROM users WHERE fname = 'Random'), (SELECT id FROM questions WHERE title = 'Random Question 0987654'), 3),
    ('reported for spam',(SELECT id FROM users WHERE fname = 'Some'), (SELECT id FROM questions WHERE title = 'Random Question 983765'), NULL);


INSERT INTO
    question_likes(user_id,question_id)
VALUES 
    ((SELECT id FROM users WHERE fname = 'Anon'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Some'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Random'), (SELECT id FROM questions WHERE title = 'Sort Question')),
    ((SELECT id FROM users WHERE fname = 'Kevin'), (SELECT id FROM questions WHERE title = 'Random Question 983765')),
    ((SELECT id FROM users WHERE fname = 'Kevin'), (SELECT id FROM questions WHERE title = 'Random Question 342')),
    ((SELECT id FROM users WHERE fname = 'Kevin'), (SELECT id FROM questions WHERE title = 'Random Question 0987654'));
