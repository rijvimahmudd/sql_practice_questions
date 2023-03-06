CREATE TABLE
    account (
        id INT PRIMARY KEY,
        name VARCHAR(255) UNIQUE,
        balance INT DEFAULT 0 -- CONSTRAINT acc_balance_check CHECK(balance > 1000)
    );

DROP TABLE account;

-- ADD NEW COLUMN

ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY

ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 1;

-- CHANGE COLUMN - RENAME the COLUMN

ALTER TABLE
    account CHANGE COLUMN interest saving_interest DOUBLE NOT NULL DEFAULT 0;

-- DROP COLUMN

ALTER TABLE account DROP COLUMN saving_interest;

-- RENAME THE TABLE

ALTER TABLE account RENAME TO account_details;

DROP TABLE account_details;

INSERT INTO account(id, name, balance) VALUES (1, 'A', 10000);

INSERT INTO account(id, name) VALUES (2, 'B');

SET @jsonAcc = (
        SELECT
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    "id",
                    id,
                    "name",
                    name,
                    "balance",
                    balance
                )
            )
        FROM account
    );

SELECT @jsonAcc;

SELECT * FROM account;

-- describe tables

DESC account;