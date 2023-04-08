*** Settings ***
Documentation    Gerenciando a massa de testes atraves do banco de dados

Library    DatabaseLibrary
*** Keywords ***
Connect to postgres
    Connect To Database    psycopg2
    ...                    yelrfbmy
    ...                    yelrfbmy
    ...                    F16TbgwvlDwXkCsecJVb5W9MfsheCKNF
    ...                    babar.db.elephantsql.com
    ...                    5432

Select Student Where email
    [Arguments]    ${email}

    ${query}        Set Variable
    ...             SELECT * FROM "public"."students" WHERE email = '${email}';
    ${result}    Query    ${query}

    [Return]    ${result}[0]

Delete Enroll By Email
    [Arguments]    ${email}
    ${user}    Select Student Where email    ${email}
    ${query}    Set Variable
    ...         DELETE FROM public."enrollments" WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

    # Helpers
Reset Student Enroll
    [Arguments]    ${email}

    Connect to postgres
    Delete Enroll By Email    ${email}
    Disconnect From Database