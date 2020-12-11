QUIZ TAKING
    -shuffle the order the answers are displayed
LAYOUT
    -helper to change page title depending on page

BIG CHANGES
    ADD FLASH and ALERT messages for failures
    ADD OAuth

VALIDATIONS
    GROUPSUSERS
        -uniqueness
        -a user cannot be a user of a group and a teacher of the same group
    RESULT
        -Must answer all questions



MAKE PARTIALS
MAKE SHARED PARTIAL FOR DISPLAYING VALIDATION ERRORS

users_controller - validations
sessions_controller -messages
results_controller -validations
quizzes_controller -refactor
enrollments_controller -validations & refactor