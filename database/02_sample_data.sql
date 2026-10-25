-- Sample data for a new, empty Support Desk schema; run after 01_create_tables.sql.
-- Run once only. This script inserts fictional demo data and commits it.
-- Install HASH_PASSWORD before running this script.
-- The four demo accounts use intentionally public demo passwords.
-- Sarah is sample ticket data only and has no login password.
-- Do not reuse these passwords for private accounts or store API keys here.

-- =====================================================
-- SUPPORT DESK
-- SAMPLE DATA
-- =====================================================


-- 1. Departments
INSERT INTO ts_departments (name)
VALUES ('Human Resources');

INSERT INTO ts_departments (name)
VALUES ('Finance');

INSERT INTO ts_departments (name)
VALUES ('Information Technology');

INSERT INTO ts_departments (name)
VALUES ('Marketing');

INSERT INTO ts_departments (name)
VALUES ('Operations');


-- 2. Users
INSERT INTO ts_users (
    first_name,
    last_name,
    email,
    role,
    dept_id,
    password_hash
)
VALUES (
    'Joel',
    'Osei',
    'joel.osei@example.com',
    'Admin',
    (SELECT id
     FROM ts_departments
     WHERE name = 'Marketing'),
    HASH_PASSWORD('Admin123')
);

INSERT INTO ts_users (
    first_name,
    last_name,
    email,
    role,
    dept_id
)
VALUES (
    'Sarah',
    'Mensah',
    'sarah.mensah@example.com',
    'Employee',
    (SELECT id
     FROM ts_departments
     WHERE name = 'Human Resources')
);

INSERT INTO ts_users (
    first_name,
    last_name,
    email,
    role,
    dept_id,
    password_hash
)
VALUES (
    'Daniel',
    'Smith',
    'daniel.smith@example.com',
    'Support',
    (SELECT id
     FROM ts_departments
     WHERE name = 'Information Technology'),
    HASH_PASSWORD('Support123')
);

INSERT INTO ts_users (
    first_name,
    last_name,
    email,
    role,
    dept_id,
    password_hash
)
VALUES (
    'Aisha',
    'Khan',
    'aisha.khan@example.com',
    'Support',
    (SELECT id
     FROM ts_departments
     WHERE name = 'Information Technology'),
    HASH_PASSWORD('Support123')
);

INSERT INTO ts_users (
    first_name,
    last_name,
    email,
    role,
    dept_id,
    password_hash
)
VALUES (
    'Michael',
    'Brown',
    'michael.brown@example.com',
    'Employee',
    (SELECT id
     FROM ts_departments
     WHERE name = 'Information Technology'),
    HASH_PASSWORD('Employee123')
);


-- 3. Categories
INSERT INTO ts_categories (name)
VALUES ('Hardware');

INSERT INTO ts_categories (name)
VALUES ('Software');

INSERT INTO ts_categories (name)
VALUES ('Network');

INSERT INTO ts_categories (name)
VALUES ('Email');

INSERT INTO ts_categories (name)
VALUES ('Account Access');

INSERT INTO ts_categories (name)
VALUES ('Other');


-- 4. Tickets
INSERT INTO ts_tickets (
    title,
    description,
    priority,
    status,
    submitted_by,
    assigned_to,
    category_id
)
VALUES (
    'Laptop will not start',
    'The laptop does not power on even when connected to the charger.',
    'High',
    'Assigned',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'joel.osei@example.com'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'daniel.smith@example.com'
    ),
    (
        SELECT id
        FROM ts_categories
        WHERE name = 'Hardware'
    )
);

INSERT INTO ts_tickets (
    title,
    description,
    priority,
    status,
    submitted_by,
    category_id
)
VALUES (
    'Unable to access email',
    'The email application repeatedly asks for a password and will not open.',
    'Medium',
    'Unassigned',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'sarah.mensah@example.com'
    ),
    (
        SELECT id
        FROM ts_categories
        WHERE name = 'Email'
    )
);

INSERT INTO ts_tickets (
    title,
    description,
    priority,
    status,
    submitted_by,
    assigned_to,
    category_id
)
VALUES (
    'Office Wi-Fi disconnecting',
    'The Wi-Fi connection drops every few minutes in the marketing office.',
    'Critical',
    'Pending',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'joel.osei@example.com'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'aisha.khan@example.com'
    ),
    (
        SELECT id
        FROM ts_categories
        WHERE name = 'Network'
    )
);

INSERT INTO ts_tickets (
    title,
    description,
    priority,
    status,
    submitted_by,
    assigned_to,
    category_id,
    resolved_at,
    resolution_notes
)
VALUES (
    'Password reset required',
    'The user was locked out after entering the wrong password several times.',
    'Low',
    'Resolved',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'sarah.mensah@example.com'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'daniel.smith@example.com'
    ),
    (
        SELECT id
        FROM ts_categories
        WHERE name = 'Account Access'
    ),
    SYSDATE,
    'Reset the account password and confirmed the user could sign in.'
);


-- 5. Ticket Comments
INSERT INTO ts_ticket_comments (
    comment_text,
    ticket_id,
    user_id
)
VALUES (
    'I have checked the charger and power cable. Both appear to be working.',
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Laptop will not start'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'joel.osei@example.com'
    )
);

INSERT INTO ts_ticket_comments (
    comment_text,
    ticket_id,
    user_id
)
VALUES (
    'The laptop has been assigned for hardware inspection.',
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Laptop will not start'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'daniel.smith@example.com'
    )
);

INSERT INTO ts_ticket_comments (
    comment_text,
    ticket_id,
    user_id
)
VALUES (
    'The network team is investigating the access point in the marketing office.',
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Office Wi-Fi disconnecting'
    ),
    (
        SELECT id
        FROM ts_users
        WHERE email = 'aisha.khan@example.com'
    )
);


-- 6. Status History
INSERT INTO ts_status_history (
    old_status,
    new_status,
    changed_by,
    ticket_id
)
VALUES (
    'Unassigned',
    'Assigned',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'daniel.smith@example.com'
    ),
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Laptop will not start'
    )
);

INSERT INTO ts_status_history (
    old_status,
    new_status,
    changed_by,
    ticket_id
)
VALUES (
    'Assigned',
    'Pending',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'aisha.khan@example.com'
    ),
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Office Wi-Fi disconnecting'
    )
);

INSERT INTO ts_status_history (
    old_status,
    new_status,
    changed_by,
    ticket_id
)
VALUES (
    'Assigned',
    'Resolved',
    (
        SELECT id
        FROM ts_users
        WHERE email = 'daniel.smith@example.com'
    ),
    (
        SELECT id
        FROM ts_tickets
        WHERE title = 'Password reset required'
    )
);

COMMIT;
