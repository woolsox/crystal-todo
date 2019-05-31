-- +micrate Up
CREATE TABLE tasks (
  id BIGSERIAL PRIMARY KEY,
  task VARCHAR,
  description TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS tasks;
