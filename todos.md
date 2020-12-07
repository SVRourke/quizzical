QUIZ TAKING
    -shuffle the order the answers are displayed
LAYOUT
    -helper to change page title depending on page

BIG CHANGES
    ADD VALIDATIONS
    ADD FLASH and ALERT messages for failures
    ADD OAuth

VALIDATIONS
    GROUP MODEL
        -name, unique in user's groups
    GROUPADMIN MODEL
        -uniqueness
    QUIZ MODEL
        -name is unique within the given group
    GROUPSUSERS
        -uniqueness
        -a user cannot be a user of a group and a teacher of the same group