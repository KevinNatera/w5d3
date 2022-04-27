
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
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

    FOREIGN KEY (user_id) REFERENCES users(id)
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