DASHBOARD
    -completed stat is wrong for students

LAYOUT
    -helper to change page title depending on page

BIG CHANGES
    ADD VALIDATIONS
    ADD FLASH and ALERT messages for failures
    ADD PUNDIT authorization
    ADD OAuth
    Redirect to dash from root if logged in

VALIDATIONS
    USER MODEL
        -email is present and unique and an email (can be simple format check)
        -password for presence, length and presence of special characters
    GROUP MODEL
        -name, unique in user's groups
    GROUPADMIN MODEL
        -uniqueness
    QUIZ MODEL
        -name is unique within the given group
    GROUPSUSERS
        -uniqueness
        -a user cannot be a user of a group and a teacher of the same group
    GROUPQUIZZES
        -unique
        -a quiz may only be joined with one group
    ANSWER MODEL
        -Only one answer may be correct for a given question
    QUESTION Model
        -may only have 1 right answer
        -content unique for a given quiz
    RESULT Model
        -a user may only have one result for a given quiz
    
    
    