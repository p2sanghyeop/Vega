database use board;
CREATE TABLE if not exists board
(	
	board_number SERIAL PRIMARY KEY,
	user_id VARCHAR(30),
	title VARCHAR(50),
    content VARCHAR(100),
    update_at date,
    create_at date DEFAULT CURRENT_date
    )