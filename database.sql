-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash CHAR(64) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Assets table
CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);

-- User assets table
CREATE TABLE user_assets (
    user_id INTEGER REFERENCES users(id),
    asset_id INTEGER REFERENCES assets(id),
    quantity DECIMAL(16, 8) NOT NULL,
    PRIMARY KEY (user_id, asset_id)
);

-- Orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    asset_id INTEGER REFERENCES assets(id),
    order_type CHAR(4) NOT NULL, -- 'buy' or 'sell'
    quantity DECIMAL(16, 8) NOT NULL,
    price DECIMAL(16, 8) NOT NULL,
    status CHAR(7) NOT NULL, -- 'open', 'partial', 'filled', or 'canceled'
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Insert users
INSERT INTO users (username, email, password_hash) VALUES
('user1', 'user1@example.com', 'a1b2c3d4e5f6'),
('user2', 'user2@example.com', 'a1b2c3d4e5f6'),
('user3', 'user3@example.com', 'a1b2c3d4e5f6'),
('user4', 'user4@example.com', 'a1b2c3d4e5f6'),
('user5', 'user5@example.com', 'a1b2c3d4e5f6'),
('user6', 'user6@example.com', 'a1b2c3d4e5f6'),
('user7', 'user7@example.com', 'a1b2c3d4e5f6'),
('user8', 'user8@example.com', 'a1b2c3d4e5f6'),
('user9', 'user9@example.com', 'a1b2c3d4e5f6'),
('user10', 'user10@example.com', 'a1b2c3d4e5f6'),
('user11', 'user11@example.com', 'a1b2c3d4e5f6'),
('user12', 'user12@example.com', 'a1b2c3d4e5f6'),
('user13', 'user13@example.com', 'a1b2c3d4e5f6'),
('user14', 'user14@example.com', 'a1b2c3d4e5f6'),
('user15', 'user15@example.com', 'a1b2c3d4e5f6');

-- Insert assets
INSERT INTO assets (symbol, name) VALUES
('BTC', 'Bitcoin'),
('ETH', 'Ethereum'),
('BNB', 'Binance Coin'),
('ADA', 'Cardano'),
('XRP', 'Ripple'),
('SOL', 'Solana'),
('DOT', 'Polkadot'),
('DOGE', 'Dogecoin'),
('AVAX', 'Avalanche'),
('LUNA', 'Terra'),
('LINK', 'Chainlink'),
('ALGO', 'Algorand'),
('ATOM', 'Cosmos'),
('FTM', 'Fantom'),
('XTZ', 'Tezos');

-- Insert user_assets
INSERT INTO user_assets (user_id, asset_id, quantity) VALUES
(1, 1, 0.5), (1, 2, 5), (1, 3, 10),
(2, 1, 1.35), (2, 4, 50), (2, 5, 100),
(3, 2, 3), (3, 6, 30), (3, 7, 15),
(4, 3, 7), (4, 8, 1000), (4, 9, 20),
(5, 1, 0.2), (5, 4, 25), (5, 10, 40),
(6, 5, 250), (6, 11, 40), (6, 12, 90),
(7, 1, 0.1), (7, 6, 20), (7, 14, 300),
(8, 1, 0.2), (8, 7, 10), (8, 9, 10),
(9, 2, 2.5), (9, 8, 800), (9, 15, 15),
(10, 1, 0.25), (10, 4, 10), (10, 5, 60);


-- Insert orders
INSERT INTO orders (user_id, order_type, asset_id, quantity, price, status, created_at, updated_at) VALUES
(1, 'buy', 1, 0.5, 5000, 'filled', '2023-01-01 10:00:00', '2023-01-01 10:00:00'),
(1, 'buy', 1, 0.75, 5000, 'open', '2023-01-01 10:00:00', '2023-01-01 10:00:00'),
(1, 'sell', 2, 3, 200, 'filled', '2023-01-02 11:00:00', '2023-01-02 11:00:00'),
(2, 'buy', 3, 5, 150, 'filled', '2023-01-03 12:00:00', '2023-01-03 12:00:00'),
(2, 'buy', 1, 0.6, 6500, 'open', '2023-01-03 12:00:00', '2023-01-03 12:00:00'),
(2, 'buy', 1, 0.6, 6700, 'filled', '2023-01-03 12:00:00', '2023-01-03 12:00:00'),
(2, 'sell', 4, 10, 50, 'filled', '2023-01-04 13:00:00', '2023-01-04 13:00:00'),
(3, 'buy', 5, 20, 300, 'filled', '2023-01-05 14:00:00', '2023-01-05 14:00:00'),
(3, 'sell', 6, 10, 400, 'filled', '2023-01-06 15:00:00', '2023-01-06 15:00:00'),
(4, 'buy', 7, 15, 100, 'filled', '2023-01-07 16:00:00', '2023-01-07 16:00:00'),
(4, 'sell', 8, 30, 800, 'filled', '2023-01-08 17:00:00', '2023-01-08 17:00:00'),
(5, 'buy', 9, 40, 1000, 'filled', '2023-01-09 18:00:00', '2023-01-09 18:00:00'),
(5, 'sell', 10, 50, 1200, 'filled', '2023-01-10 19:00:00', '2023-01-10 19:00:00'),
(6, 'buy', 11, 60, 1500, 'filled', '2023-01-11 20:00:00', '2023-01-11 20:00:00'),
(6, 'sell', 12, 70, 1800, 'filled', '2023-01-12 21:00:00', '2023-01-12 21:00:00'),
(7, 'buy', 13, 80, 2100, 'filled', '2023-01-13 22:00:00', '2023-01-13 22:00:00'),
(7, 'sell', 14, 90, 2500, 'filled', '2023-01-14 23:00:00', '2023-01-14 23:00:00'),
(8, 'buy', 15, 100, 3000, 'filled', '2023-01-15 00:00:00', '2023-01-15 00:00:00'),
(8, 'buy', 15, 100, 3000, 'open', '2023-01-16 00:00:00', '2023-01-15 00:00:00');
